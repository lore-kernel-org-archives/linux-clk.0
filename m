Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B25F3D9DBC
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 13:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777039119; cv=none; b=Ld+t3v7PjjSI8xSdsebxfqz9ddRm7gUxO1XdUDdUb48mNZxkbDKXERas82JDmXNLnramSaoAEkv1/rqm1xce64x2AY7zLVTw1VttVOPI1KPOSdmBcYx5MpUjY0xa124P7qWTloPpIQxHv92o5UubfiXXEwGxokKLtF86qqGnS6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777039119; c=relaxed/simple;
	bh=Ssr2le1yMNDssZLgJHFOiNfQv+GrasneJW4v/zdCPU4=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:
	 References:In-Reply-To; b=gf8at4aeiuoOBqcV/oV4gbbCEh4scmnb7VddjHVM9VOfk0R8Imt9Rh+uq1SFJz56nNvHuEynfa3/YrEi9w/cIDDTR/jtwFwwnnvcovjpV59RIej0pnM284IUP+xZmN6EUBU0K3oYH8kuXRP8+chjJAA5NTfUGJPvpPiF5ul0DA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=InnloTqy; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="InnloTqy"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2e221a71e19so7690600eec.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 06:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777039114; x=1777643914; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQxAgNQNXDNCO7hb32JxDK6aD4YqIXLUMAcyq751mmc=;
        b=InnloTqyXbRXljtt11abcVI1SExW6jyJHwfQIpTPJU9rJv9UKfBRx4uCq9JDYiR2bV
         bfQXffp5mmJeY8Y19xSxKSYkPT1tDUbsAD/PsAtXUCX3ZVKbfl87+lpuuyHHNaUJtHlj
         VP3jcuB7dJ6WM9Ym2mWZgbps0bRCZBsYLJJo8geB90lO+FGKbbd1LwVl1ek7aoBjP57I
         +XJLor8MpZNIsGDGsb1FLbb9/PFihiDnBz30OvQ84E/GcW+NgeRLaAItcWKBQWISA5DF
         o+VAHQeD/Pmj8HBhfE/BCg/pVEHAvPsEO9oIdKUwB3Mbh/Tdm5DfZUT2xKv+k7rubVLk
         jViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777039114; x=1777643914;
        h=in-reply-to:references:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PQxAgNQNXDNCO7hb32JxDK6aD4YqIXLUMAcyq751mmc=;
        b=EdIfHNNwS/yI9NfPO5UoO+w7AQLV35CsiEdWPaJ9EVq1o+Uy6j6pbywR86WNZs082x
         ypdbHZ2nu9HHeWjSrqLDFCi/eqicZZZP776qXtdRA122V6e/+K8rBNfvSS0c5/jJR6yh
         jDwVYtIJvjhPrYc+Q32pofiy2/zEpYzgGfdyBdAwhwJqU0SL1BKPgzCUUzaualS95Zbh
         WyxnHCKD5GxAtVqEtHdZZJD1LcxNWfw2VwsSJrWoydpNHbbZv5csmrrWXt5fuFhvcAjf
         5GfClOFCkhHoyKh6kkHFqXDKBetw7ULfvZ8J8b2jlmpvMEzPiaCBzczEOwAgPlnW6ywB
         Wsgg==
X-Forwarded-Encrypted: i=1; AFNElJ8CJHZuluP1e4onqXxk7FaQVbkkCgAoBjv7brM7++B2e+9RmNss3M6Itcbn9OVs226M/IE+yNI92ac=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyda+rQceceDqhH2R4/8RumqZ0baluYXk4nhinHZ1zv96UDnk3R
	X7YmkPr92d/XSabzqpE9//xD3Ri7ny0oGo7+Zegs7gn5cWh/ivtiXSmI
X-Gm-Gg: AeBDiet2McNvkmbEyC0edZzTd2YhMj0Fp7z3g1ubgjooRt50A97AtqrmT96oJwXCxCM
	0PqeDUuBYcDL5/91sJWZBSezgLRfi0BNl9JzXDSmCLXIoXZznEhCdltYGPH2UbaQztNPDPD5GSb
	o5aLxeqOzejyqSn3WxRu/LFp7moCva4oDOiM3Xk3wpV7ab1P5lMKCy8cD0mIerYjnoxj+z0KCBV
	a8mmI6o2G9tUD1hFmT4HYhVx3ISf45nTjeb2ZICYeHNe4TfvEVZzwuLcHJHIxRi52CdWxfTgeFj
	hB8diZwY+sCPdsMBZVGgN98MrjgBHZoNjkCOG0HIU3PZ9zbrdO5LxyXwceSkcI+Vi01s2GnXsno
	ZAzwe9RA/k/Mzj48AA+ALaTfYtiy3kw34dVCY0z6VLn46xuuktpqdtzasZ7ykQTy2zxEDbXPBVB
	yjDh8pHlU4o/AcDzYnjykfm9qpb8vK5OstvpUqMzyNV/A=
X-Received: by 2002:a05:693c:2b15:b0:2c1:3f85:747 with SMTP id 5a478bee46e88-2e47a1027d4mr19101535eec.21.1777039114063;
        Fri, 24 Apr 2026 06:58:34 -0700 (PDT)
Received: from localhost ([2408:8256:2289:187:7e9d:5b36:3e7c:859d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53dcb487bsm32940358eec.31.2026.04.24.06.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 06:58:33 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Apr 2026 21:58:27 +0800
Message-Id: <DI1FSG6ITXK3.GG7XHRD4JSGC@linux.spacemit.com>
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Vinod Koul"
 <vkoul@kernel.org>, "Frank Li" <Frank.Li@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Guodong Xu"
 <guodong@riscstar.com>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>
Cc: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>, "Brian Masney"
 <bmasney@redhat.com>
Subject: Re: [PATCH v3 0/5] dmaengine: Add Peripheral DMA support for
 SpacemiT K3 SoC
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260424-k3-pdma-v3-0-efdf2e414a08@linux.spacemit.com>
In-Reply-To: <20260424-k3-pdma-v3-0-efdf2e414a08@linux.spacemit.com>

Apologies, I just realized the version number is incorrect.
This patchset should be v4.

                                      - Troy

On Fri Apr 24, 2026 at 4:20 PM CST, Troy Mitchell wrote:
> Hi all,
>
> This patch series introduces Peripheral DMA (PDMA) support for the
> SpacemiT K3 SoC, leveraging the existing mmp_pdma driver.
>
> The K3 PDMA IP is largely based on the design found in the previous
> SpacemiT K1 SoC, but introduces a few key architectural differences:
> 1. It features a variable extended DRCMR base address for DMA request
>    numbers (>=3D 64) depending on the hardware implementation.
> 2. Unlike the K1 SoC, where some DMA masters had memory addressing
>    limitations (requiring a dedicated dma-bus), the K3 DMA masters
>    have full memory addressing capabilities.
>
> The series is structured as follows:
> - Patch 1: Introduce the necessary dt-bindings: K3 compatible string.
> - Patch 2-3: Refactor the mmp_pdma driver to support variable extended
>   DRCMR bases, and add the specific implementation/ops for the K3 SoC.
> - Patch 4: Fixes a critical clock issue where the DDR bus clock
>   (top_dclk) could be gated by CCF, which would cause DMA engines to
>   hang and lead to system instability.
> - Patch 5: Finally, instantiates the PDMA controller node in the
>   SpacemiT K3 device tree.
>
> ---
> Changes in v4:
> - patch 4/5:
>   - add Brian's RB tag
> - patch 1/5:
>   - update commit message
> Link to v3: https://lore.kernel.org/all/20260331-k3-pdma-v3-0-a4e60dd8b4b=
3@linux.spacemit.com/
>
> Changes in v3:
> - Removed the dt-bindings patches related to the DMA number.
> - patch 1/5:
>   - update commit message
> - patch 2-5: nothing
> - Link to v2: https://lore.kernel.org/r/20260326-k3-pdma-v2-0-ca94ca7bb59=
5@linux.spacemit.com
>
> Changes in v2:
> - patch 1-6 are added in this version
> - patch 7/7
>   - update commit message
>   - using k3 compatible string
>   - Link to v1: https://lore.kernel.org/all/20260317-k3-pdma-v1-1-f39d3e9=
7b53a@linux.spacemit.com/
>
> ---
> Guodong Xu (3):
>       dt-bindings: dmaengine: Add SpacemiT K3 DMA compatible string
>       dmaengine: mmp_pdma: support variable extended DRCMR base
>       dmaengine: mmp_pdma: add Spacemit K3 support
>
> Troy Mitchell (2):
>       clk: spacemit: k3: mark top_dclk as CLK_IS_CRITICAL
>       riscv: dts: spacemit: Add PDMA controller node for K3 SoC
>
>  .../devicetree/bindings/dma/spacemit,k1-pdma.yaml  |  4 ++-
>  arch/riscv/boot/dts/spacemit/k3.dtsi               | 11 +++++++
>  drivers/clk/spacemit/ccu-k3.c                      |  2 +-
>  drivers/dma/mmp_pdma.c                             | 37 ++++++++++++++++=
++++--
>  4 files changed, 49 insertions(+), 5 deletions(-)
> ---
> base-commit: 02f90981a67f3b9ee7d6684e7503a4fed7aade0c
> change-id: 20260317-k3-pdma-7c1734431436
>
> Best regards,
> -- =20
> Troy Mitchell <troy.mitchell@linux.spacemit.com>

