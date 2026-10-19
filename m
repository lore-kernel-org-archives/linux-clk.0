Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792453569;
	b=Gpz7auza4ab0xI2jdJgaphCY13y8mTeIZ3bUQ55JzLj5JXTzRfytlZdWvc64thaWOeTi
	 u5EUnSrPAAXFWu/vlMrmdfdxwa3tpI9dwmwKCLXqCEzZu1SPe2YueEs53RrBELa8dpCK4
	 lgCiqux/yLjHxZ2cEUoKQRR62h+kFqS7i/9RwLLyN/Q/PtkgRYblIf3EVjDoD3ZfY8CGQ
	 xXwT6Z6RBdC1B06uv5VRV84bJwkWOj2+0uVq+I3vq8Ah5fbqJx++GpbVIPyKJgMsSHfHP
	 k8pUpOZ7AziDNdnvrok7KGnThdc0UbnUiCy2y7dgDmnxF/RxNtGJIlQQFlHNW8TGP4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792453569;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=bANbvSVZXQhEXhYP3TP2TElb96lJqFoxNQuXKkY137I=;
	b=miqKPOHSXBBTyvyAB+pQlnLiP9fDr/xgghumzLXd8GPmUTcJXs96JQZFR4D8Zn0uNRdQ
	 UbH3EZJACnBJtnWuibBb500NvobuK1dEUaehKKpuY/ZmHlthsSzUbW30RVbHJ4Btt8qaW
	 Y7ENpQ1EggbdtZi+CYZCskbL/dXDBpwSmd7lGgmYThIoyIYKKgPk8J/qaql6emRQ0+ZUi
	 0DzmozAnkfdmYlRR8k6LOiKyRj3jW9QnzGiXnVgA02S91ZcbdRzYB45GAzkAp1og/OYIu
	 Wfr4CQKuKPOtwpyHdxZHb0NcGHXyJDXADUkgOYu5gawm7jcJP31ScdsGalHZq0TrIPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F30W39f+;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=GRsWCSql;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44175606A31A
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 23:46:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44175606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F30W39f+;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=GRsWCSql
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792453568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bANbvSVZXQhEXhYP3TP2TElb96lJqFoxNQuXKkY137I=;
	b=F30W39f+TIXr/Fp5w8uuXB9BQWFgNgayBKcU8lpItwX4Cg808rbuFGNJl54mVfJwMwu1+O
	+E9RwfNhVXOOIqQF+HIAW6fvWCgqPYyJRmvG7+Pg64bdlOrt7fRfnbf6KXvf7jW0BgCY4k
	XH3MmN6IIcQg0Gsqa6ZupKIZqrvinSo=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-6q1Dc0vjNw6arzzhK_VNkQ-1; Mon, 19 Oct 2026 23:46:06 +0000
X-MC-Unique: 6q1Dc0vjNw6arzzhK_VNkQ-1
X-Mimecast-MFC-AGG-ID: 6q1Dc0vjNw6arzzhK_VNkQ_1792453566
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53397338004so80448731cf.2
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 16:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792453566; x=1793058366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bANbvSVZXQhEXhYP3TP2TElb96lJqFoxNQuXKkY137I=;
        b=GRsWCSqlOauqbweMiMcrMlu6zh9vYOw+ktJJMffaeF4ZQFuZf5SuJGDkTuMmPyCYNi
         oAg9FBI2aRkUXRquXGUodomHGyRV5MFLyB9wEFafxLExLcpVEZRzMoIOCWuVrasLHz/R
         zEZlCB2Gz5F7NgwOi3l53TT20RKcYBrmTCPZiz4lXo5wcvPxrrBfu543sIyaksK1kO36
         xL7+bWbMnWitBP5JuUvwQICBC2JgXwpbF7kcDKnNfe/vqSXFceOcXUJINEP1hiv4Cp7g
         ryTMQAXVa2G/9xGjGPY/f2ALJ7HsiRLrwZkQ30OrHNU+oLJHhcS/gdErMG59Mr9UC4RC
         b/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792453566; x=1793058366;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bANbvSVZXQhEXhYP3TP2TElb96lJqFoxNQuXKkY137I=;
        b=bgBNJjyMwIMb18Eeza9MgBcBWK4UHHIHNxAmwfnb8yIcAeUTBmv08AWq6jiqyoN+qE
         dhqjLoLcops+w38lp2gYlq9CTntBq+jaqd6kgtmDuNkj7NkSQKYeYNLEJeTqxmZa/X/a
         Aa7c8H4j89dlHtJpJCrRAGcmfepVfU8hvhYlryoZJzE1R5aBq11Sx2fc07OUWXRB8Kub
         urV4/t9QCrFGqceoScOmilxL728KcCilI7GLId2+guMqO9vzWWhJBrlAPKeff8As/tV9
         7cdtftLgz39VRFI62NmLQrLA2cPtDKCnZAHWw0brc4OzclM7dC5DbZpYkv3M4dj4mj1e
         +GSA==
X-Forwarded-Encrypted: i=1; AKwUvBzi3uYGFqFVyICMv5IJMCWEMcjLzAn8k8q3Op6WYCnJ8bSS91CswW32ZJCyP8+MwarJQTfsRE/YNNw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIi15TgQCAzmJHH0mhj86wCwdxMq0XBuPzrpUj7uQFwv3R/LOep
	hazCnJIs11aTp6aEFq0IKmqEerQgok+GiAh+Ka/tFGRXts7Pm5rs48TRMq08omV7+cKDmvMvp/1
	PochRGQNqy4rimogEVn9gq016C79jQ9bK3N8WTLsPwpa8zerf8BZzORtnKdcnJQ==
X-Gm-Gg: AYBFou18mdxwMnTySU+awq1+VC65p5Nh/OOECN0V67ZqoP16ftplUKRiBbutqq4NNaD
	8MYQ+n4I/aNH+wA+NDcDmL+C3lp6GdY1abrDENq+q0NAxWno8duP4ju29qklW+xJO/m7WJtJi1u
	a8BJI8IDBJ95+rWvJP4LPOvX0eT2xjsfSxPGzRWc2ofueOhhRV/SEedcU7nYbxHJX2Fqg/BOydN
	h2MR1LHN3Rslgh6xhkkvli2kdbpmAylfG53VQve82xNDXFWRp874BgdhmNz53e7VtSEhydrZ61m
	RR/bgl+orBt9u59LFPJQJOMIX49HZxWNOQaBMzxAxu3UH3XBqMqmX2kXT9ueimL+ovlzuv9JoHa
	eBrATa0z0RKwNnIDpb0iRcxeOXYNAnclq9X6S5r9VKC6ZitDv4kOwkSb5TbaVUTUu7v4pDvuJkv
	LY0rjhopg=
X-Received: by 2002:a05:622a:a17:b0:536:695f:bdd3 with SMTP id d75a77b69052e-536695fc526mr73027581cf.46.1792453566418;
        Mon, 19 Oct 2026 16:46:06 -0700 (PDT)
X-Received: by 2002:a05:622a:a17:b0:536:695f:bdd3 with SMTP id d75a77b69052e-536695fc526mr73027101cf.46.1792453565913;
        Mon, 19 Oct 2026 16:46:05 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53656bcf751sm66755561cf.14.2026.10.19.16.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:46:04 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: linux-kernel@vger.kernel.org, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com, 
 Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Sebin Francis <sebin.francis@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
In-Reply-To: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
References: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
Subject: Re: (subset) [PATCH v14 0/4] Support spread spectrum clocking for
 i.MX8M PLLs
Message-Id: <179245353543.117654.7478218308853360546.b4-ty@b4>
Date: Mon, 19 Oct 2026 19:45:35 -0400
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
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=720; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=1Zr0ZL61ygpUZIVKFPvP8VcvRE1XoRbIaNzvBa5Hves=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKurd5U80jc7qBgokvY8r53frNq2yaIPGd6+GGbZZjne
 n214wyBHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzky0pGhs+LnM6uiHrk9rr4
 0/4fMZde/7r+b8/7skUtx49bnjbmeXiY4Tfbf8k6TpPFLxOWNKb+9OppWtzn388WYsB+4mNltFr
 8V14A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Fri, 04 Sep 2026 12:06:29 +0200, Dario Binacchi wrote:
> Support spread spectrum clocking for i.MX8M PLLs
> 
> The series adds support for spread spectrum clocking for i.MX8M{M,N,P}
> PLLs (audio, video and DRAM). It has been tested for the video PLL on
> boards using i.MX8MN and i.MX8MP.
> 
> While at it, it validates the spread spectrum configuration in the clk
> core before it reaches the providers, and fixes the i.MX SCMI OEM
> extension, which converted the spread to the wrong unit.
> 
> [...]

Applied, thanks!

[4/4] clk: imx: pll14xx: support spread spectrum clock generation
      https://git.kernel.org/clk/linux/c/1ca4bd0c6c0d

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

