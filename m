Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBC220B207
	for <linux-clk@vger.kernel.org>; Fri, 21 Feb 2025 23:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740181261; cv=none; b=ubJHWKLweQXn/a+ssC5l9CUSOjTRh371Bj/JBIsm4rCkfSq1SeoXVfPrQX6fFLnkryjJQTYSTGTS2iSs/2OtITXYuP8ORKmIrUeht4vo3aqRmuZWInmacu1SOf0UTSBVY4Q65AwPk/iqTAFIAAbS6zmcIaC8tK7JIUDSbTrS/Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740181261; c=relaxed/simple;
	bh=pwS0rRZAeo4K85b7BRAT0mUN789PYdreea+ymjVv7PE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YcRb9ETZeQ0/3rrBrNLfemk7Xn2jbntyYMkgwiO2p/wmaiDwPQZIJfrv5fRbElz2jEJfiJ8Cisb1d5+sK3axfIN1eH/Y2ndxqzpBVCjLD9L9JFj+aISH1Yr9qksHXLrv8eoLbMpSQ9FKjYUSiYKSFfwk+mPA8FI3Go5FRH8Wq5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Wate1kkN; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Wate1kkN"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4721aede532so24900901cf.2
        for <linux-clk@vger.kernel.org>; Fri, 21 Feb 2025 15:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1740181259; x=1740786059; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f93o7FAG90qaVAfzA0geJ/uDU/bxaCxWXA35kHGThZA=;
        b=Wate1kkN0JjhDmqJNYzTg4ONZzu4FBUhwnCk4Y2FY3926GdYyQWYFsQz04xIlxdxlY
         EY6BiP3bpz5P78thX3kWa0xqij0elX8MZH3bhADIceM/pIJZNJgC2gp9q3+aM5mujOMg
         Uh8mMvDAumPg9tzsKTnM3T0WDJe+kmz3IxB4+NO3N/HOBBuEg8ojUEysFFWmUNDCBC3P
         WsCHMFSW3AA7p7PDZSARJNlI/OU19JjcBUXPVs/IqbQo3OgggLRGUocFLdIpVNf7cX1P
         zC2TY4uDPfP2g/MwHrKMWeEgisGCKPrubfLujD+kRrHfC8kYs0ZfoSUBew0DoiEtpUU9
         4IoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740181259; x=1740786059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f93o7FAG90qaVAfzA0geJ/uDU/bxaCxWXA35kHGThZA=;
        b=jRkUfM3JQeWa9g9MnfnvzCp4WeXfrv2DxkICZSt8+U6WmWRk2dcwVxd3XHSDU3FibO
         g2kvfZ90xWbFuVZGr6zOgXSUCKDamiUNdXzEiX6hkztuweugX4itCb29CVih4nH4L1JB
         ryIASNosXfDqFUZqxP8Z4SfGl3fZB1oKZnNLdCdf88YMdGlg/7onbpXjc5q7mFiYB2VN
         FtY52GKZvq46gbDe7mO8S7U+Qf+o1ghBv0eUF/JoDlYlh65VUDI2g3d7v1os0I+Ut4/m
         1VcYak8keI3W7af3/fg/FTl0JIPavOWJp6AEyDjT1CDp4Leb0KvsLfFICuqNxl3Enpv0
         evQg==
X-Forwarded-Encrypted: i=1; AJvYcCXVrt3TP7BH45G5DYyQNeuS+lCQd1WCPGxQLQGxqoBk4/8FDnAG+om5mfj4klgr6TsriYqGHivnf/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB9waOaha8MAfRoLxyE1l1zR/jKmG4wUYUYTm823XD1KfBPEaG
	hJx6ldNA1nienpbC+3mWR/i3wsXkAK8yKe6ZVEH/HZUfmnu71mE+LdCBoZcQOb8=
X-Gm-Gg: ASbGncvYuFV+R2hXBupweT3llq2sNCwh7c/xgFvkGdG104l6mF5qT95V4J0+0h0+Sol
	1w7z80hqWkr3yvQ4NzIYRZaaWXhCKzmpudw42nPUQX170kIxrzB1qQJZJfQyr1wwIZtUYLmH9Sc
	GP++/0vK+uEBc6y/U0X0MrkyQNNLLU3W7Raz73+BRQijKceKfdhhq3hp/sTuhzI/HkXJBdAfKMq
	1+fMa0do/9m4/TVRepEVC7u/CTe5j3z/Ef+TcVGF805c9OCUaJOGIAr56QyY9Ss/gLnEzcruV89
	LuBmfGRGq156J33i2ndni4ymTpNpU9FzHqIGe7uAGV4tFumzOEBJXf1dIC4xzCHcYQ==
X-Google-Smtp-Source: AGHT+IF09Y2l1WyaNQYoNtRessBI+9y7Evefa+3aJzpT7BdL6xOrBu5WGp0qzs26a1CPzjXqQ1pKmw==
X-Received: by 2002:a05:622a:44f:b0:472:13e8:47a0 with SMTP id d75a77b69052e-4722473dd50mr66754041cf.21.1740181258850;
        Fri, 21 Feb 2025 15:40:58 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-471f506f819sm58485811cf.62.2025.02.21.15.40.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 15:40:58 -0800 (PST)
Message-ID: <7c697e9a-d6d9-4672-9738-93ce3a71beb6@riscstar.com>
Date: Fri, 21 Feb 2025 17:40:56 -0600
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] dt-bindings: soc: spacemit: Add spacemit,k1-syscon
To: Haylen Chu <heylenay@4d2.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Yixun Lan <dlan@gentoo.org>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>,
 Chen Wang <unicornxdotw@foxmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Guodong Xu <guodong@riscstar.com>
References: <20250103215636.19967-2-heylenay@4d2.org>
 <20250103215636.19967-4-heylenay@4d2.org>
 <aw2vqnz5vcccqqvrrhz5tgawj7fnzzg3tds7nnepuorit37a7r@jcj3wrs7d73h>
 <Z6rdBhQ7s2ReOgBL@ketchup> <19e5129b-8423-4660-8e4f-8b898214d275@kernel.org>
 <Z63T_EDvXiuRQbvb@ketchup> <2ab715bd-e26c-41bb-ac64-baa864d90414@kernel.org>
 <Z7BTVu10EKHMqOnJ@ketchup>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <Z7BTVu10EKHMqOnJ@ketchup>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I have a general proposal on how to represent this, but I'd
like to know whether it makes sense.  It might be what Krzysztof
is suggesting, but in any case, I hope this representation would
work, because it could simplify the code, and compartmentalizes
things.

Part of what motivates this is that I've been looking at the
downstream reset code this week.  It contains a large number of
register offset definitions identical to what's used for the
clock driver.  The reset driver uses exactly the same registers
as the clock driver does.  Downstream they are separate drivers,
but the clock driver exports a shared spinlock for both drivers
to use.

These really need to be incorporated into the same driver for
upstream.

The clock code defines four distinct "units" (a term I'll use
from here on; there might be a better name):
   MPMU  Main Power Management Unit
   APMU  Application Power Management Unit
   APBC  APB Clock
   APBS  APB Spare

The reset code defines some of those, but doesn't use APBS.
It also defines three more:
   APBC2 Another APB Clock
   RCPU  Real-time CPU?
   RCPU2 Another Real-time CPU

Each of these "units" has a distinct I/O memory region that
contains registers that manage the clocks and reset signals.

I suggest a single "k1-clocks" device be created, which has
access to all of the I/O address ranges.  And then within
the DT node for that device there is a sub-node for the
clocks, and another sub-node for the resets.  Each of these
uses 2 cells for addressing.  The first indicates which
"unit" contains the clock or reset registers, and the
second indicates the clock or reset line implemented by
that unit.

I might not have this exactly right, but below I show some
DTS code that I hope demonstrates what I mean.

Could this approach, or something close, work?

					-Alex

/* SpacemiT clock/reset unit numbers */
#define SPACEMIT_CRST_RCPU      0
#define SPACEMIT_CRST_RCPU2     1
#define SPACEMIT_CRST_APBC      2
         /* . . . */
#define SPACEMIT_CRST_APBC2     6

/* SpacemiT RCPU unit reset IDs */
#define SPACEMIT_RCPU_HDMIAUDIO 0
#define SPACEMIT_RCPU_CAN       1
         /* . . . */
#define SPACEMIT_RCPU_UART1     6

/* SpacemiT RCPU2 unit reset IDs */
#define SPACEMIT_RCPU2_PWM0     0
#define SPACEMIT_RCPU2_PWM1     1
         /* . . . */
#define SPACEMIT_RCPU2_PWM9     9

/* SpacemiT APBC unit reset/clock IDs */
#define SPACEMIT_APBC_UART1     0
#define SPACEMIT_APBC_UART2     1
#define SPACEMIT_APBC_GPIO      2
         /* . . . */
#define SPACEMIT_APBC_TWSI0     27

/* APBC reset/clock IDs */
#define SPACEMIT_APBC_UART1     0
#define SPACEMIT_APBC_UART2     1
#define SPACEMIT_APBC_GPIO      2
/* . . . */

     clocks {
         compatible = "spacemit,k1-clocks";

         reg = <0x0 0xc0880000 0x0 0x2050>,
               <0x0 0xc0888000 0x0 0x30>,
               <0x0 0xd4015000 0x0 0x1000>,
               <0x0 0xd4050000 0x0 0x209c>,
               <0x0 0xd4090000 0x0 0x1000>,
               <0x0 0xd4282800 0x0 0x400>,
               <0x0 0xf0610000 0x0 0x20>;
         reg-names = "rcpu",
                     "rcpu2",
                     "apbc",
                     "mpmu",
                     "apbs",
                     "apmu",
                     "apbc2";

         /*
          * The two reset cells indicate:
          *     unit number (e.g. SPACEMIT_CRST_RCPU)
          *     reset within that unit (e.g. SPACEMIT_RCPU_CAN)
          */
         k1_reset: spacemit-k1-reset {
             #reset-cells = <2>;
         };

         /*
          * The two clock cells indicate:
          *     unit number (e.g. SPACEMIT_CRST_APBC)
          *     clock within that unit (e.g. SPACEMIT_APBC_UART1)
          */
         k1_clock: spacemit-k1-clock {
             #clock-cells = <2>;
         };
         /* . . . */
     };

     /* . . . */

     uart8: serial@d4017700 {
         compatible = "spacemit,k1-uart",
                      "intel,xscale-uart";
         reg = <0x0 0xd4017700 0x0 0x100>;
         interrupts = <50>;
         clocks = <&k1_clock SPACEMIT_CRST_APBC SPACEMIT_APBC_UART8>;
                  <&k1_clock SPACEMIT_CRST_APBC SPACEMIT_APBC_UART8_BUS>;
         clock-names = "core",
                       "bus";
         reg-shift = <2>;
         reg-io-width = <4>;

         resets = <&k1_reset SPACEMIT_CRST_APBC SPACEMIT_APBC_UART8>;

         status = "disabled";
     };

