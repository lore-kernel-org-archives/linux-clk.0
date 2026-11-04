Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800838;
	b=Vlkj9w6SlQKwbE3nsvLEUhwtafSKQGP+J+hjiTBNRe0ZcAlUoNPjFip4efAWOdce0nEm
	 LNUZ6cIAUPIJUSonQ3Ly2xxwcCMv+uS2Eu1MOI8HrhTlH4TFHe3H+UwCd5/ZM0AWggw/+
	 aWDLpXk8GoiU9VfYU8yMf0PkubRTnqvRtkiK9ShP9td4b6rjizAoCq59V1xIjJrd8y8Nt
	 zcUEzrDoJtzAH5aolJkqu0MFZYWxBYA3yMcJqd+kEEtCXu6I6wPhPqPAmby2wJwb23NDt
	 SQBgA/LhqKoACUgep0mGI4EqmYTUcw16uSNXOM7n3QwuF+yXTB5fGAMOAeo8VbylmrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EK0JUgp8OCD/gxw0LjPEg0NrLddUOwjtQqQrgH4Zeuo=;
	b=EL0KtqfjCNDFOv/BZKbGhHxIznp3gWqd+/LTVh4UvnPR4XSqG0kCIJMU6kT05/ZtB6Q/
	 G3G+3u0EEQ1dt2X0DpJlNPin4z3wqr1uJCIqvHSoQbmO7aZGakbHP76rgT74CEf3TmO7J
	 AUeAqGr3xYllB+dctELJjeGJuqMLfxVl4WhCNt/ozPvZDuisMcpeTA9PY5XhIpVe2LExc
	 VEo31IBqGi3ydOsfeifaTxaK+Ag9NnpXRyeyoQGlYddzc1dP7EvOgzI1f+UAMiF5aim65
	 7rM4saEIliFKNckGNvslCE1OuWsWRFNaBDXmi5KAQ/ozGvkfAhAo+WTM4Mg9vbApBIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lVAYG9Bm;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878CB606A333
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 14:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 878CB606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lVAYG9Bm
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a8cc11ac42so918292c88.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 06:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793800838; x=1794405638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EK0JUgp8OCD/gxw0LjPEg0NrLddUOwjtQqQrgH4Zeuo=;
        b=lVAYG9Bmc2hoKTJuJzSrH6J+IhryAyiDTSMdo0aYG9mfqjPS/ga8+3YK2Ad//sbXE2
         HHofzfmuuJ/nJx0kE/6IytFncp6WqXb39RvQM+YnlJNPVlx4UDFXx8nAXhQykpg/r9dU
         TTw9D3mrL7B/AtTF/tGzwS4DWBrit2U6UIDoeAg8Au1ygMhfLw7GRk8WtuLYUaZkwSTF
         aYRfMnD7tWD2+C7sh5TWr6OTrCzca5srbXzkmLr+/5fdNnNFJYIheqB8xKYVa8MXmxFB
         4bAPEVWyyZRmC6vgyn2/OYmqQ8nZ9BmRTU8WOS8FvaydjpnVOWQKGf91yFtKwUSqhNCh
         RSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800838; x=1794405638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EK0JUgp8OCD/gxw0LjPEg0NrLddUOwjtQqQrgH4Zeuo=;
        b=VdUc4XzRRpUOYIvsMDJV0pj1SmkjYqVVbnLfTr5bOzQXkOr9qhslYR2YRpueVjWb0I
         PEhsSPpV8wv5Yp9rXskfFKPI1kCgW8mpI9jrt+xlFl48kGpL71MnKZnc6q2rDjGTn/P4
         F9W23Q5V0JwjlTJD4YHeLpGabQxYpvE2ipUAlxkAXWcpUKx88nA8Yi0ARPap7NTxY2AB
         nAxaG6sfZe4OlXy7NU+yL/wFwVRLYaXYfA+ALMiuGPtJXXjkXydvrkgcBDpqzkVSZqVQ
         bVXHzVLkFwUk4QQPRyNykhdIuQpFlNUUQKqLkPB7KmI6JW5t10cUA1Ae0AfW82gM68Ig
         x1yQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpthc2Wm+/cKYolfe0VMqL/DDQV+/k2+HEfUoJ5lUeHU+/jzbjyKYe8tMR6Kyx9mgHME0XclQmqDs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+i7HRbEgHqi6FbWGhn2K9a8+BCYoJ8/1isFH28qjausOndkZ2q
	aiGO76g7JazuKpiqvDj4T0QIO9VqNSnAgRBhRxGb8e9fctznMe5DNGRa
X-Gm-Gg: AYBFou2UclMBAXoblvzWMSCKIdMH0GvPQIHUy5j8xlPKYcv/EWh62wslFsXelIGCcCJ
	xC/WpAP4JO8nF1+sSys7n1NkGP60R8pyBjduWl9/FfLfeVHXt2+xeK/XdFQ7w19vyQ/ctW4SLVU
	OSRAsKJLCwNI0osky57CgLCNTv24IG0nXrbLRPQdjrQpGLlrki4WJzLRMOARudjrD96b/yErSAj
	2nMNrIBj9xsdWPpndqd/po1Y99cypHznZU032w1nzhVn/GiP5sbuonou/0HF3HLvPdQQvgDDmd6
	wsIXi4BEjzmwkaARNzK3JkXLZUhq3PrifekujkY2pG5Hzq7MDMhgtsx14vd1momoRAn8jA+tfuj
	5fym6oSpdagD5xiBh0EPPVORAbaxuUIN5tb3jJvlduWpSVkT9hS2I6CXnT/idDVKvR+7+Um8OLS
	1qhSD1o22D7Pj4KBQoJN9hfl4Aku8kLLA44j9KXST934SdFSboyAPQ6yprRHCWlNJckgvoD7Nd6
	OJVuZTO/FKxPnpekfcnd7kortI4qb/56dRs1ouTg65Z98KEEsXwzQndIq/LNJ+bqGfHMvF0w6r6
	aFQn7C68qP1B1tuGu8X5vXBXuK8wS0W8uiqEdA4dJVVZqXj+v8vn6pLmrJrLcdrF+HSGyL6QXjg
	At4c=
X-Received: by 2002:a05:7023:a89:b0:1a8:9857:2102 with SMTP id a92af1059eb24-1ac5f183841mr25563977c88.30.1793800837135;
        Wed, 04 Nov 2026 06:00:37 -0800 (PST)
Received: from localhost ([2.27.148.106])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c30521sm8553620c88.13.2026.11.04.06.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:00:36 -0800 (PST)
From: Han Gao <rabenda.cn@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Icenowy Zheng <uwu@icenowy.me>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Yao Zi <me@ziyao.cc>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH RFC v3 00/17] riscv: add initial Zhihe A210 support using SCMI clocks and resets
Date: Wed,  4 Nov 2026 22:00:30 +0800
Message-ID: <20261104140031.1172491-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <9b99c531-1977-4bc1-8105-bd9c3e129951@kernel.org>
References: 
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, Krzysztof

On Wed, 4 Nov 2026 09:24:15 +0100 Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 02/11/2026 20:45, Han Gao wrote:
> > This adds initial support for the Zhihe A210 SoC and the Melon Pi V1
> > and V2 boards.
> > 
> > The A210 has four C908V and four C920V2 cores, plus an E902 management
> > core. The E902 firmware handles clocks, resets, power, the PMIC and
> > CPU DVFS, so Linux uses SCMI for clocks and resets. The only new SCMI
> > piece is the mailbox to the E902. [2] explains why I picked SCMI over
> > RPMI.
> > 
> Considering how vulab@iscas.ac.cn is ignoring reviews/comments and spams
> with a lot of unthreaded emails, completely disregarding any tries of
> contact over last 1.5 months, shall we ignore all contributions from
> @iscas.ac.cn?
> 
> Maybe this will be the only way to actually be heard?

Apologies, I am unable to communicate directly with the team at vulab,
but I have passed the relevant information on to them;
I trust they will handle the matter appropriately.

Thanks,
Han

> 
> Best regards,
> Krzysztof
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Sent using hkml (https://github.com/sjp38/hackermail)
