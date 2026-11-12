Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494808;
	b=mkQFzwIp5z5M99oYqusHBN44cftAf3RNQz+sgdzE/5Jw+EJsFrccRdLWsG/jyE8g/Jh5
	 C8PpVoItKZVcDNW4UPJ5FWj3bF8kcDKqytMq6gXrc51BTQTTHAKIo6+AV1PMXcU+kbAPR
	 FYetBom0IBnq1x88xVrJeKFJmKIDFa0pjF4x45IcFwTD9ei4QPkNgRcaWiyihnPCi04sz
	 DH+vloylDeb57yVA8sPHsRdQKgyeXfN+x5MnfcnJsWcusjVrT9mig9j0XA77xZuxRZF7o
	 oJS2gF0ksdyWw0S2L9J80QgELBTCtbu9NpInyGF+XP7yWTz7Fzn+aiohTF5Iih1EpOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494808;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=DeS1JutKTfuhS5q6pNbvmoX+jSrEwDPcQETf0SHwj/c=;
	b=VOGL0vQHzpwXHilbqJ+B8H+YA+Q/inu72Ad8g3+n/w9s82fIeBAdB/71l6CJbt7I5Qk7
	 /A8H8gVpjPiTCno9k5n0wdQqmPctyjMS1y18CHVTb6TuyypKC9iz0x49DUCNYf51PiysC
	 mXdwRHmII4dWKwhFI6NmcyA41RwiUGDOAFuqQWZaoIjesPVj+vOFGATNLJm8A8TJyPZzI
	 7XBAPaVRX9gKRiVi+/Ryh9lvnY9aC6pncDCI9BUOLtfyC2SYijLXBShbzFkWT6OWKDgjX
	 U0ch/WjVjRFPqXT+t97bIqXAKlEX3QnkKqkAXM/AWMsOGgKnetCdqrm4X9uJRYlbdmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1509606A338
	for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 14:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1509606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5ee1e4e3abcso559517e0c.1
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 06:46:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494807; x=1795099607;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DeS1JutKTfuhS5q6pNbvmoX+jSrEwDPcQETf0SHwj/c=;
        b=Z25QpaPv0RxC4noiONU5OwXEmwG9C7JX4IkF5IrFuRPUPe116CRBO7BPW44DYqZTPd
         V+otWf7zfROpJGyRkxNi79yspANdRGjLqcHY657nHkpYgBWYvFLAlDTU/QEjwk008UfT
         dl0mpiEGQdzBoQg9ue78wLy9p7Cnx9yfUK474+hcY7Mz3dwwu9+5PSWCnmi4p0PG7GZb
         QgiA2YZqOMFPmA8bCJRImbInSm8cHz/7lswqvA/t8zV+Q+SWVUs1V+0bbQDNfA0i3aGW
         twQABihj4/ZDC+CwrOy7YcyZAdBa+uOUnj/k2AE2ze9mbmk9pT4dJLnpikwXEQMBe2Wu
         DKTA==
X-Forwarded-Encrypted: i=1; AL+hErEUiZIebYSYDth8+NWKlhy68WDLlLuQdqQt7df2Um92OIaD5+0ClHhgcx2FU6YcKSBEakLoYtWN+BA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/omLQIELDh2SoyGSU7OkgktdWZzIysCoxYib4PhIqNGoZQjKw1
	xrtij4JDPu2Rq0YjXvL0hH+3s+AGowg9jlgljL+b9tHeD9Rzk7QyyaR//I7wqeaARxw=
X-Gm-Gg: AYBFou3SOSBWROkH7Z9TSIDymmLkh/aziLzLZ0eptp0fmQS/eNzB8fvqyOd9gc0/kxq
	P+cc5Fl4xFQQECQU876B+ryRH8W87wtpPgauwOoaqwWMnvwF0II9IFkU0i4qUUPpftv+dZ9KJBZ
	DfMgrj6UuoyKP1R9mzscg7RjYt2xgkmVhmPqdmWgxllbQfVK1w3ehWkEApn0JCwemgwzHHdadMm
	iywPmxIPjxb0ooeNyGIJq2AGyq+ArnnFyeBK+MJQn8JiQa9JUwH8OfF7+BJ6+ZETuMSIbntUiCM
	Gp5iH+7+F6rBS7nic8VuPmZxaTrgXXmzyTpU6bqudmBHSSgzK6ZIJ3NQqh+TA2XKTd+ks1+XoAw
	qYtNOwfDVNB5BXIRePafOb9qWK9ImWrUoRQaYr6FLlaJcYdiegXObzaSsuBUPvVa+nn2HExER29
	2K19iAR3dURTTeyZwwPkFYyesgXky4VIYWs02PcBI4WXvQUCOILJ2vTN46UuwdODeQHqPqyDuMM
	S+53AbMx2K2xz1VB663GY/Dc3CreUhwDx0gUtbeUWkSTtLHtEBKeHgArMLGTuqukgFdguVxvDqm
	yRu9eE10xLQ05lonyMyobyOb+jhh9EgBXOwMqi1YsD1kbSSt7ojA6b5wqzXQWX1j//n/XBA=
X-Received: by 2002:a05:6122:1b8c:b0:5ec:e128:2c19 with SMTP id 71dfb90a1353d-5ee1c4bbafdmr2532013e0c.23.1794494806732;
        Thu, 12 Nov 2026 06:46:46 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c2019bf87sm6069210241.11.2026.11.12.06.46.45
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:46:45 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5ee1e4e3abcso559482e0c.1
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 06:46:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG2AfP/cfuO+jLEulygu9jkCcVjXW12mKhjr1I2flT8LH5RguSVtBSRQ+TqaQmWVwuM0CVIQk0uFnU=@vger.kernel.org
X-Received: by 2002:a05:6122:398e:b0:5ce:d56f:efac with SMTP id
 71dfb90a1353d-5ee1c4995fdmr2096272e0c.21.1794494805148; Thu, 12 Nov 2026
 06:46:45 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-0-1b2072e8c37e@ideasonboard.com>
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-3-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-3-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 15:46:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVKr2fGN3k0LYHhoFp3Rp7_=KfTB6tQkGYDof0Em0HVtA@mail.gmail.com>
X-Gm-Features: AclHuK-vYdrIZUHe9zqdC5qY90reiPN1Oa4nwuum4GsEnnZB7I1s1LzmhCydy1o
Message-ID: <CAMuHMdVKr2fGN3k0LYHhoFp3Rp7_=KfTB6tQkGYDof0Em0HVtA@mail.gmail.com>
Subject: Re: [PATCH v4 03/13] arm64: renesas: r8a78000: Add FCPV[BI] nodes
To: Paul Elder <paul.elder+renesas@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Mon, 9 Nov 2026 at 14:35, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> Add DT nodes for the FCPVB and FCPVI IP cores in the R-Car X5H SoC.
>
> Use the SGD1 clock as it is likely to be the clock used for data flow.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> @@ -1574,6 +1574,78 @@ mdlc_aon: system-controller@c1338000 {
>                         bootph-all;
>                 };
>
> +               fcpvi0: fcp@c5030000 {

Please preserve sort order:
  1. Sort by unit address,
  2. Keep similar nodes together.

> +               fcpvb0: fcp@c5038000 {

Do you want to sort the FCPs within the FCP group by unit address,
or by label?

For the contents of the nodes:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
