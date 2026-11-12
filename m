Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492585;
	b=km4/wwiWiMQSK71B2L7yxr636AqHKlMhOFL03/x/HuDPDh4qoXQr2Idg/5hoZui5rZP9
	 BEJMcJ9FeVZt5uiBcPHITptGpGNwkWmeqyY6ven2ZBFCuwq5WJN+36QROW04UjGWR1IYb
	 My6HSSDejp1EkXP6NuIlKarHAD+BYwpwARu3r0AeRdD67mDZZ+G3pNFZglakq6T9KJSvp
	 VRaE70QPTZj5tUN2t2dm0tpVM8+hyKw8Y3GtCjqP2Kz9eALx4W116+H4jdaPJ/e+Ge/yX
	 Z8hh1LnOJgSqa9RwDpIEzZEbXeg5gr9Jio28icHJAfwvSGwsWV5RJUEXNdp/J8ldudQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492585;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=SmLZ8gf1GKBz7EI8vmfSH7lLCzmVzRkRLb0jnz0/qbk=;
	b=h5VmJ7q/VT9mEz+pcHqUrFQfbgQ6Xm5diYf9bI/xjU0GrlED1BJT4SCtA4e059CjMUaq
	 RkA2BBuukZ+cYZR5Nvnjcm5vi4JiiSWsbn2DcXswqcAIcLlM0ozTcZsBOOk1JbqBO9eDw
	 0AqqOb/pva913We3rUdRaSj2yluqznkXmOy1TPKRvMB+P2gm1VHcfcr8vJ9gq4IijJGtd
	 B+6M/W/7qzsERck8xrMDMIDqBEpOJAo6UOkMeyTqUdelzmjrtZK69UyPCDCX6/O43l1qa
	 ESlGxG4Ajgd7YrB6GCDUrmJmEgXLoMAgGpRXwzlphWVu5MTK66uQjqWPPV42lAY/xow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="XZNd7Am/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8766606A31C;
	Thu, 12 Nov 2026 14:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XZNd7Am/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 213BF1F00A05;
	Thu, 12 Nov 2026 14:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794492585;
	bh=SmLZ8gf1GKBz7EI8vmfSH7lLCzmVzRkRLb0jnz0/qbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XZNd7Am/j2siX5Bd4nG4XDFcC61MusmSOn062NE0PVt+q1l5BHBXMWjmuVxKwlocd
	 sUlxcuWxs7+4FaEUeLOATmg+F3XyC4tjkpMo0oZ9kmoDfe/eJB80BssqOZ11c2V7Yp
	 N7D0PZW0nPtNxgWzPcqWIpiIg8FXcbtr+IawNhlPm11pqotdYaH4pRQtjCSAxomHMs
	 rt6B2Kxe3GvRL1sG2IWxUuTSZAmlyUtCy5+xDcP79C2yUjIiea6WCjbYmWmCZNnxdL
	 x7VkDDdxx0pYCwPN27hWU+aEyxZldmtkQ3Rn9xXPDBR0XVjn+GazatHC28+dvdIkBA
	 3gl9W7Exo5TSw==
Date: Thu, 12 Nov 2026 08:09:43 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: jbrunet+clk@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, bmasney+clk@redhat.com,
	michal.simek@amd.com, devicetree@vger.kernel.org, sboyd@kernel.org,
	krzk+dt@kernel.org, p.zabel@pengutronix.de, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: reset: convert zynq-reset.txt to yaml
Message-ID: <179449258263.406339.11789920788113048063.robh@kernel.org>
References: <20261111150812.1874449-1-radhey.shyam.pandey@amd.com>
 <20261111150812.1874449-2-radhey.shyam.pandey@amd.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111150812.1874449-2-radhey.shyam.pandey@amd.com>


On Wed, 11 Nov 2026 20:38:11 +0530, Radhey Shyam Pandey wrote:
> Convert the Xilinx Zynq reset manager binding to DT schema format.
> 
> The reset output list is kept, hung off #reset-cells since that is what
> the numbers describe. It is preceded by the encoding the text version
> left implicit: the cell is the register's position in the block times 32
> plus the bit number within that register. This also explains the gaps in
> the list, which are reserved bits and, in the case of 0x23c, a reserved
> register.
> 
> No dt-bindings header is added. Unlike the firmware-defined IDs in
> xlnx,zynqmp-reset, these indices are derived from the SLCR register map
> in UG585, and no in-tree device tree references them.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
>  .../bindings/reset/xlnx,zynq-reset.yaml       | 99 +++++++++++++++++++
>  .../devicetree/bindings/reset/zynq-reset.txt  | 68 -------------
>  2 files changed, 99 insertions(+), 68 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/reset/xlnx,zynq-reset.yaml
>  delete mode 100644 Documentation/devicetree/bindings/reset/zynq-reset.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

