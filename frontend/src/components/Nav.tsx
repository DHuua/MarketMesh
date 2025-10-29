import React from 'react'

type Props = {}

const Nav = (props: Props) => {
  return (
    <nav className="bg-white shadow-sm">
      <div className="container-max flex items-center justify-between py-4">
        <div className="flex items-center gap-4">
          <div className="text-2xl font-extrabold text-primary">MeshMarket</div>
        </div>

        <div className="flex items-center gap-3">
          <a
            href="#download"
            className="bg-black text-white inline-flex items-center px-4 py-2 rounded-md bg-primary  text-sm hover:opacity-95 cursor-pointer"
          >
            Download
          </a>
          <button className="md:hidden p-2 rounded-md text-gray-500 hover:bg-gray-100">
            <svg
              className="w-6 h-6"
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                strokeWidth="2"
                d="M4 6h16M4 12h16M4 18h16"
              />
            </svg>
          </button>
        </div>
      </div>
    </nav>
  )
}

export default Nav