Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F160F4749D6;
	Wed, 22 Jul 2026 17:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784740590; cv=none; b=n3jJMneocmeX3jWGWt6DCxY1aPOwxvhbYII0iIjXJkD1HcYNO9fZJR2b6C3rHPdtNLm63Z1oUew5EFRWeq27WdNtLtsSCdXlw/lKpAGkmEBsJTRIejJEC819/bNsPxzI5NLPzJk0IUZFFCOqnkjPbzEiecggXX7yAXYD5UiqYQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784740590; c=relaxed/simple;
	bh=E8JdTNtjAEU2qZZnCK7UKY1G5BughNsoCAsermk5pBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lVY7pUmnYVbLFqt/C+U1v6rzfqwyYoxTmdaBLlSthcaaoPGxusljcfgSYM1YebEP8jQRN+xnw5KVE20Oz9LzR2qaxLCV+9C8ujDdaw36WcJGnZ3iqBb+zlwTG6EuWK1fMIpjb1fKnFu/5Is7KuyD5QUOSToF/z9zF9V/nfT6Kcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kYXSbZv4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kYXSbZv4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442951F000E9;
	Wed, 22 Jul 2026 17:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784740588;
	bh=ikw1+fL6btnWMYc4tslEQEKoB0CU6o+pa5SOHWA46gI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kYXSbZv4mVL0UQWusAhHj0XYr2/hUbIKw5N9P6IfKdCxtg9TDAMtJL673i/SLQsQy
	 yAJa3q4gl5e9gvGBdiZjfBZ9E5Io578KTu53K2WPu8rerzMCFmJIp45O9yz9KO3k4A
	 mBmufbr6HHb84wZAvttFbGoFwI3FJ7xm8jmb44krRBJI5UVID8c3hnWOVw8RJuAr12
	 J0Aj2JwL88XuuGc5YUsr1b6g2VnmVyWDYjkDEP5Siey6yYEgwS8ULNWFyXAvvYkGG5
	 1BJMwchk/g+x8CTeg/bR62Tbcwgt+dtLyxFlTIBMBLWC7R4TF8rPxP+uc1/m0CmdOS
	 p/RGgJRhAhStw==
Date: Wed, 22 Jul 2026 12:16:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Fabio Estevam <festevam@nabladev.com>,
	devicetree@vger.kernel.org, huang lin <hl@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Jonas Karlman <jonas@kwiboo.se>, linux-rockchip@lists.infradead.org,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: rockchip: Add RV1106 CRU
 support
Message-ID: <178474058544.1144777.17019195106018644429.robh@kernel.org>
References: <20260714193656.2196447-1-sjg@chromium.org>
 <20260714193656.2196447-2-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714193656.2196447-2-sjg@chromium.org>


On Tue, 14 Jul 2026 13:36:38 -0600, Simon Glass wrote:
> Add the clock binding header and schema for the Rockchip RV1106 clock
> and reset unit. The clock IDs are numbered continuously from 0, in the
> same way as the RV1103B. The header also covers the MMC drive and
> sample phase clocks, which the CRU provides using control registers in
> the GRF region.
> 
> The RV1103 is a package variant of the RV1106 and uses the same CRU.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
> Changes in v2:
> - Renumber the clock IDs to be continuous, starting from 0
> - Provide the MMC phase clocks from the CRU rather than a grf-cru
> - Mention the MMC phase clocks in the rockchip,grf description
> 
>  .../bindings/clock/rockchip,rv1106-cru.yaml   |  60 ++++
>  .../dt-bindings/clock/rockchip,rv1106-cru.h   | 300 ++++++++++++++++++
>  2 files changed, 360 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rv1106-cru.yaml
>  create mode 100644 include/dt-bindings/clock/rockchip,rv1106-cru.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

