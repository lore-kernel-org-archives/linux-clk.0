Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8B14B04B0
	for <linux-clk@vger.kernel.org>; Sat,  8 Aug 2026 14:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786199961; cv=none; b=TGE9afQ8Aa+npD5wZZK+epimzvbUpOdGuAf3e+UL2RKyb5/CxP3IN3qxXxc/doz8lg3t6lVkQEuJcE3G75AnzJzWZVZkUAPD+hZErjZAk+Swv/sp1D8n3EpkQAYXOceF5HzVwOEHCftgc7dRFi0iRtIENgPbGa/I3RaEOXB6OLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786199961; c=relaxed/simple;
	bh=GNZdbMnUJ+VqGa8a7gNHiTQSeSgxpLKBAsS0DNjAnew=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nGPriz9Y2fePO2YXNNRQvwzc+qOkQnuq5/7PotZuO8+xzBsaGpwvVke5hcLc+fIPGyL1lLGrlVb3OG6Oqjl+Ne9zONFfz46JYReGYtymuQUNJBg1kY8D5amMRz1jwvWyqUxXQIqHL+7ysowBwyVheS3ja55DIEM/n3qZ8ZTI0dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D26+vpQv; arc=none smtp.client-ip=74.125.227.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D26+vpQv"
Received: by mail-pj2-f9.google.com with SMTP id 98e67ed59e1d1-38f0f8ab050so595760a91.0
        for <linux-clk@vger.kernel.org>; Sat, 08 Aug 2026 07:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786199960; x=1786804760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gLPlagPSnxq9fTONnyyz/3ddba5KQ5Gz9V5u0Vh5tVQ=;
        b=D26+vpQvhZwWjfur4gExF4hKMVinXGQ8obSX9UAbU8f4ld5iF9Pm94eQ3TZBsRHat7
         fGS8VUOKSbooARdm29094mB/TDc/gC2+RZoXTwImtkQ8TEpMNSezTACtE6BNV7omosgf
         ZG5bxKg9W7DpJVstLlKmpbPpC21cwjUnRj8TD/GOSNbucSFcdyfoURNJNBxyFS6pkWyW
         uDAjqu9Z5F2Db2j/lxJH7Meii1iltQKblF9l/8NeDat4mjRWXXGxx4jo4c28ilqXXYtj
         kt4tVac3ruTmKa54v8N8oJVbk3VZyEwKn9VVinio5Yn2yh84uiN2iQ+En55SWY5K9r3Q
         OYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786199960; x=1786804760;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gLPlagPSnxq9fTONnyyz/3ddba5KQ5Gz9V5u0Vh5tVQ=;
        b=aJNxRPw6hSPdfWKo0lLyvoLf5x9qj/HzCrFV1cemDDEsFinVgqQrKrO9VNut4Y5R4W
         ldDaKY4RfE09ABpD3Dit8oWLklWiHkmNY83wHlLj7pxk54ei3E8XNar7MrUtyljgch4M
         P2cWNtLc6jImBO9FP93kkqL202LbYGYHrJgTxpeOB3/eCdotmsKkvEDoLgqy3fslq6g4
         Rfx+vt8giiEAXTwHGqqCRk0YdiGllgbdI+PMLX35FIS9Mtjx9umyZp6diFFWBSP3QSB3
         9M4OgGlTWhzbD2Dak7Gj50spd8tPHLeZ0v42j4iROLKK6ED6kmANOHOc90VtHuLZaudK
         Lugw==
X-Forwarded-Encrypted: i=1; AHgh+RrEOITjZn3Nz22J5qqBMA9Rtx98GTkgier6kouA4gOi/V7qvHliMMI9nMYnRZG0rUp2mO3OZSyIDfc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx14986k3VMboMwunljP5sgpDDZue83Rvt4KIfja3apv66KdL0Q
	rL+fU4DMi1qbTDquV6X/GC7AGFO80QI8m/L8B2d+Ex7Wy18bfmWFDRKT
X-Gm-Gg: AR+sD13KPaMjSCUVUwPvi8nW+Xn7VSbA9EOxJW+7VwfPNRJ90VNmJ29h3zXNsY6xqa5
	LI/f8XmlDl2Nawaov+DvcsZx6B4LzbAXDJHi2Y/mNAODigRCWyVYmdFdXiflOp9dKOP6/i0h2na
	8Mu89BBZfBdANOnMYQyqasj6B9sjO4BisrXS2wNcqWXXRcowPUiZcNs0Fc85waf1geArkrYi+na
	micIVerq13JW0xs9kZUwjnJop2ORnQBjiU9TmdQ13BktwcW8en4corTd4EWJE9V4NIcifYSthyg
	mHywQT2Z8HIdb0dk7eK05z+AmY3zgZP0OzpO5NUhTKmyXNKvjjXDvclpygFC5q4q4TMaIhwRkNR
	/5U76rEEeh+Bn3rFC16ZEiW2baOj7twGb9TDvrolgED7jo0FbAUpTRhHQ6wcfiHEAuKuO9TyDEn
	qevjjKbHcqLMcQt6ypEbw2TkQ6Gs5Q4LN5ggod3JA=
X-Received: by 2002:a17:90b:2585:b0:38e:bbf1:de34 with SMTP id 98e67ed59e1d1-39261fdab5amr13832835a91.7.1786199959787;
        Sat, 08 Aug 2026 07:39:19 -0700 (PDT)
Received: from localhost ([2403:2c80:17:1e::20db])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fd95794sm6424491a91.7.2026.08.08.07.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 07:39:19 -0700 (PDT)
Date: Sat, 08 Aug 2026 22:39:16 +0800
Message-ID: <ec84e2ba71be5e82a3afcf257129bf58.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Yixun Lan <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Haylen Chu <heylenay@4d2.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND 03/17] dt-bindings: display: spacemit: add K3
 Innosilicon DP/eDP controller
In-Reply-To: <20260807230404.GA2211679-robh@kernel.org>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-3-6de34d80e86c@gmail.com>
 <20260807230404.GA2211679-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Rob,

On Fri, 07 Aug 2026 18:04:04 -0500, Rob Herring wrote:
> On Sat, Jul 25, 2026 at 12:51:12AM -0400, Cody Kang wrote:
> > Both K3 instances are the same IP and share one compatible; which one
> > behaves as eDP is decided by what its downstream port is wired to, not by
> > which register window it sits in, so the binding does not distinguish them.
> >
> > Signed-off-by: Cody Kang <codykang.hk@gmail.com>
> > ---
> >  .../display/spacemit/spacemit,k3-inno-dp.yaml      | 140 +++++++++++++++++++++
> >  1 file changed, 140 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-inno-dp.yaml b/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-inno-dp.yaml
> > new file mode 100644
> > index 000000000000..865ea310daaf
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-inno-dp.yaml
> > @@ -0,0 +1,140 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/spacemit/spacemit,k3-inno-dp.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SpacemiT K3 Innosilicon DisplayPort / embedded DisplayPort Controller
> > +
> > +maintainers:
> > +  - Cody Kang <codykang.hk@gmail.com>
> > +
> > +description:
> > +  Innosilicon DisplayPort transmit controller integrated in the SpacemiT K3
> > +  SoC. The K3 has two instances of the same block sharing one compatible;
> > +  each acts as embedded or external DisplayPort depending on whether its
> > +  output port drives a panel or a connector.
> > +
> > +properties:
> > +  compatible:
> > +    const: spacemit,k3-inno-dp
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +    description: Link and hot-plug events.
> > +
> > +  clocks:
> > +    items:
> > +      - description: Pixel clock for the controller.
> > +      - description:
> > +          Pixel clock generated by the DP PHY PLL; the pixel clock above is
> > +          parented onto it in use.
> > +
> > +  clock-names:
> > +    items:
> > +      - const: pxclk
> > +      - const: pll
> > +
> > +  resets:
> > +    maxItems: 1
> > +    description: Controller-wide reset signal.
> > +
> > +  phys:
> > +    maxItems: 1
> > +    description: Phandle to the K3 Innosilicon DP PHY.
> > +
> > +  phy-names:
> > +    items:
> > +      - const: dp
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Video input from the DPU.
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Output to the panel or to the DisplayPort connector.
> > +
> > +    required:
> > +      - port@0
>
> Shouldn't port@1 be required too?

Thanks for the review. Yes, will make port@1 required in v2 and
describe the DP connector on the board side (dp-connector) so the
graph is complete.

> Otherwise,
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Thanks! Will pick up your Reviewed-by with that change in v2.

Cody
