Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493249;
	b=lYEnAnDljhagOd0i/1H+Gn+XZ6jBDPKTDQsgjtvvGDp4iMQg2rpxqSjmtU6F7eYpjjCr
	 WFroKZLcziT4q+sh0J5MZVARuUx09jhQTKZsPV04earyN+CVEGe2VnJZJrufw4mjN8gO3
	 kyLH11gpUPfGxKQBYQ0cJkGg7E8yuMol8mMbOQTHX7sDut5uPnlvxwiqx5MiKNfGVUIuX
	 c7/iG0ekBXYXG8K48AnjWE/C6BkCmzkFw8pUflluyFm9X7iQr7BZeROmvaq+nlwguYVWN
	 COIi/uEv2JQeodOIOGCv7xgfiGUFNfiGzQz3QgfiNTZMa3IlQcWi4H+QJ0d/l01Acpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493249;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=p9x4nyKp58U6HRLjvUMttJNHFZj1/ft861x7cFqIKgw=;
	b=gD6tlYSynU8RdYbxSVCk3b7HkCzVuuM5tqaYrltAw0Df9xEDCd1BJMjfOhcBpGa0IchV
	 P+17zCT+HyZHBuv0IXXGp2+A46A2bxR9iRMqPLQ95LBWRms8EbcDmDU9VVy+YLS0woK8E
	 5fztoiNVvpVbsvakszlBNeNtlxHsnXLQH+RJtSBt2Bzk4TckJmgJ7vAvc+IqHdiuusH32
	 ACwh4Q3p9KeQh5i5xWv0nt3VhuffOJVljn27F6iMZL3gfFlc0vux8H908P0GF4PQGumWH
	 nwnDAcECv2PMtqtmq5TXMM4i2SUy/dXtcOcTc6mo01pq7GxaPK/R4Po64mGASd8c2nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFCE606A8BE
	for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 14:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEFCE606A8BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-53c4b82919fso57842701cf.0
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 06:20:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794493248; x=1795098048;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p9x4nyKp58U6HRLjvUMttJNHFZj1/ft861x7cFqIKgw=;
        b=H9J1u99+3JRyOOChVoyUWWk7E+eYXfTt3EmdFg7RmP+RSIdOwTX0qPOZzg3RPSe4fb
         mPPAX3IvFckwoWPPOwCgJ0Zn3Hvb4U4iQiEhW4PI0RcufIN0mF7Y1DNI+y8JQBqsb5GN
         3VJUhEVCqvVaqc92ZGL+VLRiRJK0J5zb9paiuZm2OmPvKKUTKsrQS41K8BcjjsrIoK22
         fBWCoGnZ27mZD6BMAvuia8cSuDRPW6zIQtCnaaaM3i3dPUCfvaMQfBqpbZu5pXUQy3iu
         CndJhVEnoHvVjZPIKpf2JoOc/WX1ApOg6xJQYxmvy3kugD8sA9q91asfKM/yqX3p82TH
         rgxw==
X-Forwarded-Encrypted: i=1; AL+hErHARDcikgJl2FxpUczFuLz7Ux2LKx+GM44aXvP51x+20KPZR9Bn9wUZg3Mrgxh7tyU/SMFLGkpESZw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/L6RgtKYtgzOsTJNuL0sFyMTkkocp7fdNNSY2Hrt+65NXRKzv3
	vycJVxHpi/9CDkGYrlyxtQqOVDEL8/l1SbKerbD4FmIk7WnR/a0PkYKJG6UrugL7BVI=
X-Gm-Gg: AYBFou314bEfiC3y46+cWrpzZIHU3t5retYCwSr/s9yT0jO0iyehEFQTyoacxoHMv0+
	MphuS05F1rxKiVETLtJKspOx0USRR5/2CKvRV612oXgAuZFDEjUvUgSo2mWu8kIP9q5V51ZL97j
	b/L29gYrRV/dAZhAumzND1xWKzHqjak6PCjGtjc1pKH5GDugGsuvv03dLkPKAGLrQhIsre95yWQ
	JECdUQAdoTb4KxP7QkL4H1zDbNTm8kGi52VRLw4e2j0052l6HTJkBzETI9koAGe7kmZZV75o8iC
	LwnnobFYlCPQg5NC3fy4mTVHBDjewWTybAtRA6binBavU1Yh/KWCIpw4ZDisXlavT8vfbsrISTj
	6bzojRwAJQXf1uxNtbB76j7CTog+lIPsCufmL7x+VSxbSpVHxjMOL4tDzQS2RWtKDHxje+EU+fE
	zhoL2/UGBL0UIiLSqFOyllpqYq1KSpRHpP9IubnvhyL90j85j0um4KJdBDrWyqvx1EotWfwzZ5E
	Ilage1j+ZqOCAfxAhegiQ4ws3xrdWGSW8Ggnb9beEonoJoGBKAXX5jQb8JhhhG8PRJ/W5ODFOZV
	NybfIRw+nNvbQG/Rwo5QuO5ztJwl5lfhWipiBNuH1c/VmUert0wsp0zPESFSOMHU2loh0RAjUHN
	3y/BFOjTJI4Qh4/T3
X-Received: by 2002:a05:622a:2994:b0:536:33bf:7bf5 with SMTP id d75a77b69052e-556c0208797mr92111671cf.29.1794493247578;
        Thu, 12 Nov 2026 06:20:47 -0800 (PST)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com. [209.85.160.176])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f0ffc6f60sm27984706d6.14.2026.11.12.06.20.47
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:20:47 -0800 (PST)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-554c0d47d17so35853861cf.3
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 06:20:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFV1+LHAGCDYftoZ463A3UCYK60uk/r7XO7XaBZ3FWY2LvlA2oCylvyWGlH1VBUzHWfYHfmYhJDVxc=@vger.kernel.org
X-Received: by 2002:a05:6102:5798:b0:7c3:881f:b620 with SMTP id
 ada2fe7eead31-7d5060e293emr2040092137.21.1794492899954; Thu, 12 Nov 2026
 06:14:59 -0800 (PST)
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
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-2-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-2-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 15:14:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVBBySyLE=5gG5HvQV95811asBZ7LKwsQXAVPdUPjjTTw@mail.gmail.com>
X-Gm-Features: AclHuK_i81THT_hnDNfFBzoyAYqo67SKua85inNQRuBh9I9Xk4b1lG_6SVOc53s
Message-ID: <CAMuHMdVBBySyLE=5gG5HvQV95811asBZ7LKwsQXAVPdUPjjTTw@mail.gmail.com>
Subject: Re: [PATCH v4 02/13] pmdomain: renesas: r8a78000: Add SCMI maps for VIO
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

On Mon, 9 Nov 2026 at 14:34, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> Add SCMI maps for the VIO domain to map the VSP and FCPV power domains
> and module controls.
>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
