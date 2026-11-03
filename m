Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793671668;
	b=Ym3pxUY00JwjfUSbH1m+qhnC3yL72H1zxcs5jLEV01OYJGqcUdWgYlAN1FiR3pUHXQ8k
	 ftkSNGIgKxhIq3rW3O2XPZzhgy13Wnj62a6um3tZpB7qCyepu7OKw6gimP9kljnrhYsMR
	 fpie7CifzukcQUdikDuVLrSrSyBKy3t7XlCQa8mz08Z7T3NqXbHgHFm84BilS0i1WKpyy
	 A5BHjBfHbVaSLlVDuJzKJbsvhERwMKAAo3Am8L6bGgAz76PK48PZ42OeSd2GH2bVVctxA
	 2QWr4lL9DpWE+98DWZVTGRpTPPizgtty3A22ntz8RJToFKSsShJ4sxdwEnHBavRHXaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793671668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=mnCMgi1Mjc7rqcgOPGVHBPcSRGGmUVFCpLTaHePthjU=;
	b=zn4N0E+FfQKwg0gCrAO9sk/yPZCdkupD6WKAcXN/hDvGrXepXKctG0gsXfWMn0SkuMRt
	 J3qzsIqoFoRlCoSjYxKRbywlKk1FanjfqAViI0McxE35RMkKZA7KyYKoAhER4R3yZzHmU
	 3ak5UFffIYlVpfpjM/N9aFEViUy+TrRyTQFuHiSyQv10R8lWFOv4c/Ks5lAbL5WRIPNao
	 2S1/DMPTOjSB8autAFEJZVT12zm/Q6ppyoy9QIevcb6XQOd6CvOjAZ96xbqA/TQuCL6Mm
	 i8htxGoJW1eisIQRnOdIdBsE26DmP3yT/xCBv1Rvz2XOF9ed9Q2sWuPt8Sf7qQlGuSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=aLjZ44wG;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29312606D807
	for <linux-clk@vger.kernel.org>; Tue,  3 Nov 2026 02:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29312606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=aLjZ44wG
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a8cc11ac42so3520630c88.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 18:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793671667; x=1794276467; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mnCMgi1Mjc7rqcgOPGVHBPcSRGGmUVFCpLTaHePthjU=;
        b=aLjZ44wGmMHqn8e7JX/I8P1V8VARuQh9o/ia1bogyOm6JOCislA1YcxOmIPAwzWMj1
         IStM6BfN0n6A/Mi7nmKeP+I/YEQ4JUI7eoCX12cJ9HDCtLihrgNPebZlvOTpH2BmP9dD
         jawS7ea3vQz4o3ANdgnbSTDQswDHEQkKX/To8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793671667; x=1794276467;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mnCMgi1Mjc7rqcgOPGVHBPcSRGGmUVFCpLTaHePthjU=;
        b=Nd6UNatj/zJXJIvI6fr3u+ymH37AJc+8+MAi1Qhf1C4zDQ+BUTCUzQ+SY3nxtvnV1A
         B1quaOAJJjao7PEHBgEtui4ro5rlxbSsedM02jOWz4rrjGAxf/MbtIRbtasdQDUUgf8w
         RRi8flNagpPyIConidwbr1Ca/7KCSc6GRQBTE6aimj3jfWKU1hNTOzmbh53aB2w/l/Ag
         iiuJ5J/rc8E52v3xyvrIINW94B2jWZGvSJ9y5UMOaZ8F3RKQVAuHAT7ZfzDRLPn3GI4T
         SpeAQaiYYJLPM3nxg42aeP51r2BTi/VniWezEWHL4xdqdUoeRTsEir8py7aGlfNsk/y0
         47qg==
X-Forwarded-Encrypted: i=1; AKwUvBw5qcZUtdavDRf5mtr4SRCsbV2LiabcfEeocpd9huCUnee4nVnCoW3KvxiwS1zEtSGz/IKGfjoi6ok=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKVBTqGzf+FUul5V+mqaGOs/lN5Xss+sTsYDCEuDhjjR9o7UAS
	tGx9t2YH8TpYY2Bvak+YaeWvkIvtfHF6mbZqGBq+kUOeooiX+mdwzLP1zT9EIaXMHg==
X-Gm-Gg: AYBFou2KsYjBIfPLk3iLgBxzY3L4b3LcCzJHwoeu5k1l98Lks3+C5LuXiEOZGX5xCn7
	Ezgp9drCE1b4XoCyu0SrGpbF0xyh1EhJbL3K4DOPgUDXxUIL2gESg8CCKBSDCmp/cw4CBhuI4SE
	UB+M+03USgD2LnA4yNRCmVQbkE8euU7p8zInJ5k0+6SrPDzZfy0epzNTEhswgJi8XBv8nY+i4xJ
	YJQD18ibFU0U7Sfk+rr8d4FHbE8/mppqgYV0O59frHeKE0Y7aTBKwvTNrxTNLR8Q+BWkRonXgVW
	et61Uq1S0YQp1nIKPzQ8hRfTMy+Poy/kDQ3TftQlLZ23bPbNeCSzKgzb7fhJd12e4ZoOg6FsLx2
	3gLrwAOqAMlUKiPK4ZnTXabSJ6Sl712l4RX5WsRscOiv/UO8IF+ig4jaIg/g+BUgj4B+RtzYxav
	Y7n0GoqoZ3wgt+MjD5OoMvc087XIdjC4BWLRtT/QwaK/BvHrBpQk6UvPLa/GreyaHgKtlL4qw+6
	zH6uyvvbWun74Lndl+5bIuMrbHWb0Z3sOIFZzQizBKS+LfF244gtciBB1c/e1hkMDFfHSyoBgYD
	ekXBL2Xsp+s/99XTIFb6F47NMybP6uta3vdg4NYLt8A4dfCiXEKKa1lfDl6qp0/As5A=
X-Received: by 2002:a05:7022:f105:b0:168:e942:4e62 with SMTP id a92af1059eb24-1ac601d2f3amr14793852c88.40.1793671667220;
        Mon, 02 Nov 2026 18:07:47 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:c57d:c93d:3543:aab5])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b23b847348sm4090158c88.4.2026.11.02.18.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 18:07:46 -0800 (PST)
Date: Mon, 2 Nov 2026 18:07:44 -0800
From: Brian Norris <briannorris@chromium.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>
Subject: Re: [PATCH 3/9] soc: google: Add CPM over MailBox Array driver
Message-ID: <aulB8F6hc1eDvyfj@google.com>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.3.I7bc547c83b7bf677a62670099f481a91ac737073@changeid>
 <20261028-literate-pony-of-valor-3209fb@quoll>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-literate-pony-of-valor-3209fb@quoll>

On Wed, Oct 28, 2026 at 02:27:05PM +0100, Krzysztof Kozlowski wrote:
> On Mon, Oct 26, 2026 at 02:43:41PM -0700, Brian Norris wrote:
> > --- /dev/null
> > +++ b/drivers/soc/google/Kconfig
> > @@ -0,0 +1,13 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +config GOOGLE_CPM_MBA
> > +	tristate "Google Tensor CPM MailBox Array Interface"
> > +	depends on ARCH_GOOGLE || COMPILE_TEST
> > +	depends on MAILBOX
> 
> Can it be compile tested without mailbox?

I don't think so. mbox_request_channel() and friends do not have stub
implementations for the non-CONFIG_MAILBOX case.

Brian
