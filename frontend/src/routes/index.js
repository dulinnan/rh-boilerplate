/* ============
 * Routes File
 * ============
 *
 * The routes and redirects are defined in this file.
 */

export default [
  // Home
  {
    path: '/',
    name: 'home.index',
    component: () => import('@/views/Home/Index.vue'),

    // If the user needs to be authenticated to view this page
    // meta: {
    //   auth: true,
    // },
  },

  // Account
  {
    path: '/account',
    name: 'account.index',
    component: () => import('@/views/Account/Index.vue'),

    // If the user needs to be authenticated to view this page.
    // meta: {
    //   auth: true,
    // },
  },

  // Login
  {
    path: '/login',
    name: 'login.index',
    component: () => import('@/views/Login/Index.vue'),

    // If the user needs to be a guest to view this page.
    meta: {
      guest: true,
    },
  },

  // Register
  {
    path: '/register',
    name: 'register.index',
    component: () => import('@/views/Register/Index.vue'),

    // If the user needs to be a guest to view this page.
    meta: {
      guest: true,
    },
  },

  // Contact
  {
    path: '/contact',
    name: 'contact.index',
    component: () => import('@/views/Contact/Index.vue'),
  },

  // About Us
  {
    path: '/about-us',
    name: 'aboutus.index',
    component: () => import('@/views/AboutUs/Index.vue'),
  },

  // Booking
  {
    path: '/booking',
    name: 'booking.index',
    component: () => import('@/views/Booking/Index.vue'),
  },

  // Listings
  {
    path: '/listings',
    name: 'listings.index',
    component: () => import('@/views/Listings/Index.vue'),
  },

  // Listing
  {
    path: '/listings/:listingId',
    name: 'listing.index',
    component: () => import('@/views/Listing/Index.vue'),
  },

  // Mapping
  {
    path: '/map',
    name: 'map.index',
    component: () => import('@/views/Map/Index.vue'),
  },

  // Admin
  {
    path: '/admin',
    name: 'admin.index',
    component: () => import('@/views/Admin/Index.vue'),

    // If the user needs to be a guest to view this page.
    meta: {
      auth: true,
    },
  },

  {
    path: '/*',
    redirect: '/',
  },

  {
    path: '/home',
    redirect: '/',
  },
];
