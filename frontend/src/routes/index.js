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
    meta: {
      keepAlive: true,
    },
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
      keepAlive: false,
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
      keepAlive: false,
    },
  },

  // Contact
  {
    path: '/contact',
    name: 'contact.index',
    component: () => import('@/views/Contact/Index.vue'),
    meta: {
      keepAlive: true,
    },
  },

  // About Us
  {
    path: '/about-us',
    name: 'aboutus.index',
    component: () => import('@/views/AboutUs/Index.vue'),
    meta: {
      keepAlive: true,
    },
  },

  // Booking
  {
    path: '/booking',
    name: 'booking.index',
    component: () => import('@/views/Booking/Index.vue'),
    meta: {
      keepAlive: false,
    },
  },

  // Listings
  {
    path: '/listings',
    name: 'listings.index',
    component: () => import('@/views/Listings/Index.vue'),
    meta: {
      keepAlive: false,
    },
  },

  // Listing
  {
    path: '/listings/:listingId',
    name: 'listing.index',
    component: () => import('@/views/Listing/Index.vue'),
    meta: {
      keepAlive: false,
    },
  },


  // Admin
  {
    path: '/admin',
    name: 'admin.index',
    component: () => import('@/views/Admin/Index.vue'),
    // If the user needs to be a guest to view this page.
    meta: {
      auth: true,
      keepAlive: true,
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
