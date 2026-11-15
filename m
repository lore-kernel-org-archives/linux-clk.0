Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794753750;
	b=NqrXt1+hmJ5GeS2qnN/ANOD8I+ZAto7+2O4qA/f01zayaEgjupxqToqk1e4io3nP0t+N
	 h8R9BG6TMALUDibbD4+cjjjKk0s/18XRaKvYvywEEdvcAw9FRwGQtK8RrSRIscP59mqn5
	 HBNvgrJBsAlEoyrtLb1Xwpdb4yjsdc0uRy857kUxdYEKE+G+eGtEm7PWlFrpx2P8knZHX
	 Z2mHXbD5APovkwsuemuyrY3gZDxe0V4q7B1UDWHynvIR2qGFPPbbfbxlaY5bnYZWBdkLJ
	 6dxBy9vL9YMTQW7QWFK7RKfHUb1kW71LZ723/U6MksNabEKmyGUBp/Kr8IxpzXwbZZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794753750;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=dAUG9itb1DceZsbgfGeIfItJJItPj5Pk5T2lDscbORM=;
	b=aepSfn9PdreQCRUxEgnzWzBUofLZovddODrTlgG8rJcWZ5X0qUvmfRUI2hnOAf5pdvQB
	 SUUmGrrAbp9Y/Aw9ByFWo9RbuqNs0Uo4fy4VBX0mSft0IX1w+YV725v8de1ZPZZEWb7JK
	 iO+Pvkag4J7E7dxEn0yH85mS26JMRdp9J2JIWHLoY50yTLSHUofEIIDNVVYkvlgQv11Wb
	 upnfcddFTgAFqq2VhJhkfV7DnomHFCaMCIsqKnxp9mhR7EEP1NpKBo03bsrXvlHNmpWLa
	 7vQ0la3TaV6oxa2ErwVoS3oNgyKyajzwYge4EaTcnSZPSe0E27NI4b6RfCtdcXXT5lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e3WHPGu8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DE3606A31A;
	Sun, 15 Nov 2026 14:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e3WHPGu8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8969E1F000C4;
	Sun, 15 Nov 2026 14:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794753749;
	bh=dAUG9itb1DceZsbgfGeIfItJJItPj5Pk5T2lDscbORM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=e3WHPGu8uCEixn7WZ5MdPvpjjsenLQwhcdinvIpUi/EM8Mqs3j0lImHKfMEDN9H2J
	 Td05ACPL6A3FSnHLoSj/4tdTM52SEqkFjyZTZ6Zr8IQqlPE2/DDNYJA+9HYtzoIUlD
	 jHLkhOKhH6vORFt/DpWu08DPJvC7nZtJM4Yyhcc82iMdSB1BJoARJhcM6a2/vjlHjr
	 TRTdQ3dILRNix6CxFeIfLRyMiHtvrmw5dlhhLgnqacSm4l/qJXsOaSirSEsh7+St3G
	 /iYcVwLoxFWLgEL63jpuikWPdjNDt7hi9n/hBH948Q9vxVrn3eHl7sCZQ9squo67zI
	 HkbC4T1l4mvyg==
From: Chen-Yu Tsai <wens@kernel.org>
To: Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, bmasney+clk@redhat.com, 
 jbrunet+clk@baylibre.com, sboyd@kernel.org, 
 Andre Przywara <andre.przywara@arm.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org
In-Reply-To: <20261115061102.229680-1-jernej.skrabec@gmail.com>
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
Subject: Re: (subset) [PATCH v3 0/8] drm/sun4i: update DE33 support
Message-Id: <179475374632.3212936.18354501331414111023.b4-ty@kernel.org>
Date: Sun, 15 Nov 2026 22:42:26 +0800
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Sun, 15 Nov 2026 07:10:54 +0100, Jernej Skrabec wrote:
> This is second series out of tree which aims at properly introducing
> support for H616 Display Engine 3.3. Previous series [1] reorganized
> driver so proper DE33 support can be easily implemented.
> 
> H616 DE33 support was actually introduced a while back, but it was done
> without fully understanding hardware design. Issue with existing binding
> is that it considers planes as resource which is hardwired to each mixer
> as it was done on older Display Engine generations (DE3 and lower). That
> is not the case anymore. This series introduces new driver for planes
> management, which allows doing proper plane assignments.
> 
> [...]

Applied to drm-misc-next in drm-misc, thanks!

[3/8] drm/sun4i: Add support for DE33 CSC
      commit: ea008133ef8078934a0dc2924a8263d645f0ee1c
[4/8] drm/sun4i: vi_layer: Limit formats for DE33
      commit: b1ba050890684fc7615fe4c7d523f4f46c1696b1

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

