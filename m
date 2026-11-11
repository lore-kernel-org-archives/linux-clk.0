Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794410920;
	b=OXHIichKslP/BCWaJmvDdIqBPiqjq0J3EMpdxmgXLZEtA2ISe5wnqHQlUERvg4ciFUFK
	 lKTLBvljI+aaywG57CFO+vo4yKW153jemHdHKkAi7MzcFt0jriCCY6fr2MMHEIgOdKMOM
	 I19u3bNixIAHll3QbnOHmfaiSp9mYi+4XuLLWtDF7FmRcfDT+I91PrzGQghjs1Ot+HEwp
	 qJGufz2WFRVjhQpzdoHEDvgFB5Y5AacgPWDMCSVL2thuNwdXgId9NCs4f8/6HfciK7dOP
	 kIBrMfFZTv2vW4qiReFRXS6dnjGasZ/PsOhLxXqJPjcGZ546AMBd7Ms4iKZC/BO+d0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794410920;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=bjSv1XsBMujaNhaJRh9MvS8t1Brl66ZxiWLhcECWri0=;
	b=2qNMODelHjRF3RcDUJDzXD64ATVPMv4/LtvpXcBxogRYOQ6BCqHj/Zx13//uCyxmlrdF
	 +HqqsuMeIborai4u3EO42uKb7XV1pkB62KEyHAQAY0Se+8Zf9v8xdrBAkAjYVodM2ZG/V
	 NoEKf/cLfP5IMKu6SN33r+doc/oqcb85O71/vFDLB9s4fDpDoBOMpyKUhkWjpHH6dm6NR
	 38BMT3NgZZB6nYopcOk03g3NgYgORIS11LYCmlcaFTqHBSw4vj12r4swATRjp1U9kc7gc
	 vmWWBbvA5ZjUDZ4k4SjPL/eWdmGmEZLK1xKEb8DplD+5H4a8J4OLoIMPmd/yRHTM6vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SR3+ZIZC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8971F606A32A;
	Wed, 11 Nov 2026 15:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SR3+ZIZC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5F7E1F00A05;
	Wed, 11 Nov 2026 15:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794410920;
	bh=bjSv1XsBMujaNhaJRh9MvS8t1Brl66ZxiWLhcECWri0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=SR3+ZIZCLdtTnoVy//GrCC4HXOm4Jn40gO8H9g6khWGHLAjdEjn6U0vog36o98TGw
	 9E7usnl2pOjHGDdTvkjfK9zCVEYLeZ/4w8mr535nxFe2in4nZqNmIIyuObNVNH1I3s
	 it86FSoPdpfICOVMty+Qdl6KzeVWzKZu/3TmIWkmlb9Sym6zbA+w/YYoR7NQ7ek5vs
	 Kx7pg3d5e7lJmvQ0IRK9rFspqC3V+r04vqvlvCCL2dGFbTDD0UCcH3hJTxs3jCNc/h
	 6fG+6gRY36AoK7F57pTXMY4k9sWAxjXrRwm+mXaWDa4vIQgAK63jtoBEwUBeuLsE9l
	 GwSbwxE5Z11IQ==
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
Subject: Re: [PATCH] clk: eswin: Keep the TCU AXI clock enabled
From: Brian Masney <masneyb@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Yifeng Huang <huangyifeng@eswincomputing.com>, 
 Xuyang Dong <dongxuyang@eswincomputing.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Brian Masney <bmasney@redhat.com>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Min Lin <linmin@eswincomputing.com>, 
 Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>, 
 Pritesh Patel <pritesh.patel@einfochips.com>, 
 Han Gao <rabenda.cn@gmail.com>, Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261110-eic7700-tcu-aclk-v1-1-72db82bf59c1@iscas.ac.cn>
References: <20261110-eic7700-tcu-aclk-v1-1-72db82bf59c1@iscas.ac.cn>
Date: Wed, 11 Nov 2026 10:28:34 -0500
Message-Id: <179441091475.1131744.8859651362389020365.b4-review@b4>
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=1040; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=z+HGmtMUdWM1EKWRhHoD6bQsx34aIiCc8r72ukWTyvU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK+dC6+2HQo5w7397Nqgvdum63l+3covdpWYYJRy7Gmp
 GlSD9tudZSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRo2qMDKvm2ba+Sfn04c46
 OwbbLd5d95KuOfvzrC9tTM3R2RjcHsLIsEl1W2qs27z4/uTOU5tzKyeriFZcD+x75/7mzvddTod
 /MAEA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Han,

> The SMMU TCU needs its AXI clock for DMA, even in bypass mode. No driver
> claims this clock, so clk_disable_unused() gates it and DMA through the
> SMMU stalls. On the HiFive Premier P550, this hangs firmware loading of
> an RX550 graphics card.
> 
> Mark the clock as critical.
> 
> Fixes: cd44f127c1d4 ("clk: eswin: Add eic7700 clock driver")
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

Cc: stable

> ---
> Tested on the HiFive Premier P550 with an RX550 graphics card:
> 
> - Without this patch, amdgpu stalls while loading the RX550 firmware
>   and CPUs can no longer be halted.
> - With only the TCU AXI clock kept enabled (the TCU configuration clock
>   is still managed normally), amdgpu initializes and the IB ring tests
>   pass without any manual register writes.

Please include these details in the commit message above the ---.

I can take this patch, however I'd ideally like to see a review from
Xuyang or someone at eswin first.

Brian

-- 
Brian Masney <masneyb@kernel.org>
