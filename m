Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCAA2BEC45;
	Sat,  6 Dec 2025 18:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765044423; cv=none; b=imdzAEAhEKGF20Vi0hOg8zJ/mtpZrfY1fRYPuwso1OCRr8D4+qctFML+jUv2jugBncxzhSGMMQPlXsxJnUwgHQKeU8JNcGp2rsdVAxVRQTlDxqr1PQCDPJnZs7wJ/iX6rSARpZZX9JiP+yP6F/DlMGDZvifywLfZ2iIDWWI+m1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765044423; c=relaxed/simple;
	bh=B37AD7kGs+19OffSVx/MwNSJ94v7EqiGrR8bSeQHbrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H6aRCo/0v+DGOCm+v8onCIqzKFyvO8YWmFlRXwUepmF8SPJcjdu8xr92BHD+1Y4GUqaUP8f6U4ozZUvQQNb1eEpGFFc+G1y+Mx5/vnc/ZbyWktojgPTueXi+yQVjHW5jaSiFUy2fAq67xxtGB9/K4cseRJGJjXBxiokvXh4pSkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=f3LYA1VM; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="f3LYA1VM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wmiMhIObz4qJTw0WyrJ74DiYS/rNajQtsF986FAkJkI=; b=f3LYA1VMSH+smHurSsL7bf7sMK
	zvG+4WsnFEyOgwW10QDnzWvixTBySawa7YqJ6gbYiHV8dR4/9H7Fw/OWLSAyov9ine9BDiVCM/zLX
	dH4pwe/PdWi511d4SWaB5IrGENmV4Xf1JpjuW+4FaKVbHmlXAded1JYT76HvutchG4og=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vRwg5-00GDoz-HU; Sat, 06 Dec 2025 19:06:41 +0100
Date: Sat, 6 Dec 2025 19:06:41 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Robert Marko <robert.marko@sartura.hr>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org,
	nicolas.ferre@microchip.com, mturquette@baylibre.com,
	sboyd@kernel.org, richardcochran@gmail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com, luka.perkov@sartura.hr,
	Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: Re: [PATCH 4/4] arm64: dts: microchip: add LAN969x support
Message-ID: <d98b3069-861c-456d-8637-67e36dc107bb@lunn.ch>
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
 <20251203122313.1287950-4-robert.marko@sartura.hr>
 <a8185e0f-a3a2-44df-af37-1ad505ce9a7b@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8185e0f-a3a2-44df-af37-1ad505ce9a7b@tuxon.dev>

On Sat, Dec 06, 2025 at 03:53:42PM +0200, Claudiu Beznea wrote:
> > +		port29: port@29 {
> > +			reg = <29>;
> > +			microchip,bandwidth = <1000>;
> > +			phys = <&serdes 11>;
> > +			phy-handle = <&phy3>;
> > +			phy-mode = "rgmii";
> 
> >From chekpatch:
> 
> WARNING: phy-mode "rgmii" without comment -- delays on the PCB should be
> described, otherwise use "rgmii-id"
> #779: FILE: arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts:750:
> +                       phy-mode = "rgmii";
> 
> > +			rx-internal-delay-ps = <1000>;
> > +			tx-internal-delay-ps = <1000>;
> > +		};

I did a very quick scan of the patch and missed that. It is great that
checkpatch is now commenting about "rgmii".

1ns is very odd. You need a total of 2ns, so where is the rest coming
from? This definitely needs a comment explaining what is going on.

Also, RGMII typically does not need a SERDES, unless there is
something like an SGMII to RGMII converter being used. So is the phys
property needed?

	Andrew
