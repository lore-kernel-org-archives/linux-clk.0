Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984374;
	b=fl9YP/Ko2UbTkXaDWiHvwWFK3vJJ+ZaKKB90VnRCRaHBw/JxMYVq1i2FYEWFULnbz1Ux
	 Hd616kf94k/T9uyueHXDq1hN0miLFhSyyMOPJQu0CLb4goZZ5nma9DMROra26dUdwMTdt
	 NK8a3O33YVnWlqPL3be0Dum6g1wD7LKi2jzMHn+N/JbUGd64Zce1Mt6RbzWC4669lVJQx
	 l8PVPh5+kzsajyvS1LI5USMg8PohoF2SuUvGF/sr/YEC7paQz0ieAbk8DTAqgE2OSF5ed
	 cfo6rq807Sw54Q9Y1/hVIQQjV9sxsswCQ2L+ENupf/UHlyMXSi/i3vHYjn66DIRNsOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=He80xqzSECUlwJoMnQoGCscLltd1EBIEH84Xtz6o9n8=;
	b=D4Jx2eZFzrAIRW57LkDsCajAtZfW2G+tUYW+ZSiELk0jk0mRpveO6EhPIjwKGh+kKRJR
	 Gp7vbAbkGf/DfKDMqvseElYk4PP2Pw87lGPpOmITo95ZwRRR+63jvxwBc+pB7wQ0CI4bE
	 I7KeXG1GWqcrj4ciB+NnnmLzVhWHBU18/VlyWzizFDorWSApH2h46a4FXRHbUC5x0t6Vj
	 bAlhkF8R3ky/CqmZm7gtZ8hCVqgATUn/oy4+0DsoSa6FLGR0zNE1rokqCxUjSN5ohNUHg
	 s5Js9n2fx/1U2oMHoELhCS9xnyE1LwExaCx7rG/RBE7txmG0y2yE1Pu37YfpbebbKbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=IW9u+YJi;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB48606A32C
	for <linux-clk@vger.kernel.org>; Fri,  6 Nov 2026 16:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EB48606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=IW9u+YJi
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so10810225e9.3
        for <linux-clk@vger.kernel.org>; Fri, 06 Nov 2026 08:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793984367; x=1794589167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=He80xqzSECUlwJoMnQoGCscLltd1EBIEH84Xtz6o9n8=;
        b=IW9u+YJiOW2+z21M7QUKqWODPqGNgcxkSgBdL8rFtFAPP6DJB/T8SLXqx5woyJxqjd
         s1wm5P9v3mo47s/qZXzrOTtfkr3my54cWP/ahfFfsZIKCcKROCdfguM1qaBrLGg42JU9
         HHz9M9Xv2Ktd88qEPa91zAD8IWrUDGwhbvmRuwYCvGQdZbFV/3cXx319XmqXSe0u1kG2
         GsLzjXBEgl/yClnIBL6ny3sur36m1oj7AsY/Lp/C5u5QuDwdi9ONIoWJ/3fFJRqPV99n
         uHD8ZtgAeLJkRqHM/XBaYT4FuU/LamzAaY32EwIJLgmdCHCVEbezOGXcbqZXqt+4LPA/
         vqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793984367; x=1794589167;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=He80xqzSECUlwJoMnQoGCscLltd1EBIEH84Xtz6o9n8=;
        b=UVfoEp9b7lO9+HT04vkVeImDzxNvbsu26s+MctIQ1dgQG0gEwdZ2dttUrdZfnQvQS3
         n71+QX5+oMC/8C/a2g+b+NlwzAjVG9ovGaFdFzUiZL6lH75ZX4LjGiZJ648I3G45RXH/
         udtF6mf3OtD9/iWO1iv69AlMGtuaNPDO8eSmS0CBfaZvTsvMdraRK9LJVtSbkBaDFHzJ
         eqImo0G1zclM2KZ5trUf3CHCtkPkglE8lbR3Nd3ps5ek3AHLABYkS+igCVW+hQ/a+t+F
         Z7ERtS1W693Z/cW+SmghNUSl4GDIiVCl+Dl+8xlOg+Vi9LQP/R/2G05OXtBkTgF1hWeM
         E0ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0vDJQjnIEgcNfBcvdsmuodes1Hf1DlhrEnxm9xqgTliMlYLeu1rZUVUl6khGHO2u2i3lWaakMQpQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8Qa9QbM/v4eLiik/D+jXiYC7fqsUCEoX161A86p6N4QTHb6rj
	zS5YsW6koHXy11vcx+GV6JlpZ0vQUbjErWiaSle63pZ/ZahgKutL1utmjsiNifEvtRg=
X-Gm-Gg: AYBFou3JTHLXMlkQGWqvT3rmn/QBtpeByxJxup/J0iIk+uCJ6gmTKcBAeLASRO4RyUu
	S4PtcK5pj2mv1wO94KypHc1ZSr4QZd3weXSmSfPupAFFM65rppqR9/arzTICi39L8b/K4RcQSzI
	fSOEiDIL6qRp9IkNHYHmje2hVfCwtHqa+z2BNYtbMkUDdUUkPiH/Jrc0sO+sj+zm6tms40StVft
	KFjiccieaX18afL9lHK0ErWdwOzhPEt2ubfMqOOVWB/RpcNJcHuKuZyL8ESE5eegS16Q9RzTjaP
	NDC9TY0jpQNj7ZoZd7iCvBtS/f5H6I0VmAywvAJeCKFg2kIjqt6jUwcKOuh/NM1ezt5LLAV8xu3
	Yn2oWxXn2R7GHc0LQrr2987c0Q+vb2tWUrUzcyT3c+Qmh5G548uoT3WSAscJk8TEQ9ilgEd1adC
	DjoEMfzg+dyA4bh5k0WFL76r+cffZ869Gjm126T3nI/gNuQdkYeImmvjDiYUdlNCo7BvRlbwp3A
	0nNXyfZ7ODvnwTOPNMPKBRsq8wxlZ7rRCtZt/huulHsioCD4L6nUvzg6qPoHRxuxyleniXMi4uW
	6VtlxBsxEkKIwZvsh28P6uz43+tmYAVjiHkjbpev7ygVWcuhxVuTY+5S
X-Received: by 2002:a05:600c:3e85:b0:4a6:eca1:7d5c with SMTP id 5b1f17b1804b1-4b6e035ef86mr50697355e9.32.1793984366792;
        Fri, 06 Nov 2026 08:59:26 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b56e58fcc6sm271729585e9.2.2026.11.06.08.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:59:26 -0800 (PST)
Date: Fri, 6 Nov 2026 17:59:25 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: Add SM8350 camera clock controller driver
Message-ID: <au4HToRcyRPtlOrG@monoceros>
References: <20261104001704.2744766-1-vz@kernel.org>
 <20261104001704.2744766-3-vz@kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="27unomee4c2a2acv"
Content-Disposition: inline
In-Reply-To: <20261104001704.2744766-3-vz@kernel.org>


--27unomee4c2a2acv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/3] clk: qcom: Add SM8350 camera clock controller driver
MIME-Version: 1.0

On Wed, Nov 04, 2026 at 02:17:03AM +0200, Vladimir Zapolskiy wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h> is
good enough to provide of_device_id already. If you insist on full iwyu,
please use <linux/device-id/of.h> instead.

Best regards
Uwe

--27unomee4c2a2acv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmruB2sACgkQj4D7WH0S
/k75Lgf/X/gQ12cXgo6nsk4EXDZYkr8FQDSpC0uKXhfmB/r7EILSd8SjAvIot57F
qB8dFy7S88DSeDaL3vu7EPr1aRkjaxgBQPzybHb9sFTkAYBW++6++VMnsvekOXI6
SqwxrQYgyRF1tIjO2wudqpq34uraG8yQk7HrhxudUJRZRIMfucrirHshkIWQRyB4
hQzb/5ApOHw5zK53j/kvXWMKmlxziXsl1V/6no+W71bgnWHkmuZY+a032blW6xfH
Jyy4w+WBdsmYezTvMt38tUiMQ0qE6O5oT7OLyxgeaSSKUT6QZ9cvi/sxDsngQaNp
qFxPxTJv+s+t8FhM84ScwzCh5Urq3g==
=r1vx
-----END PGP SIGNATURE-----

--27unomee4c2a2acv--
