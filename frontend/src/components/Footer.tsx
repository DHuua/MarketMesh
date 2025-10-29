import React from 'react'

type Props = {}

const Footer = (props: Props) => {
  return (
    <footer className="bg-gray-900 text-gray-200 py-10">
    <div className="container-max grid grid-cols-1 md:grid-cols-3 gap-8">
      <div>
        <div className="text-xl font-bold text-white">MeshMarket</div>
        <p className="mt-2 text-sm text-gray-400">
          Share, preview, and download 3D models
        </p>
      </div>

      <div>
        <h4 className="font-semibold">Company</h4>
        <ul className="mt-2 text-sm text-gray-400 space-y-1">
          <li>About</li>
          <li>Careers</li>
          <li>Press</li>
        </ul>
      </div>

      <div>
        <h4 className="font-semibold">Resources</h4>
        <ul className="mt-2 text-sm text-gray-400 space-y-1">
          <li>Docs</li>
          <li>API</li>
          <li>Support</li>
        </ul>
      </div>
    </div>

    <div className="container-max mt-8 text-sm text-gray-500 border-t border-gray-800 pt-6">
      © {new Date().getFullYear()} MeshMarket. All rights reserved.
    </div>
  </footer>
  )
}

export default Footer