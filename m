Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03906431A4C
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 17:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786468309; cv=none; b=MjFI+YU2mnLW3O14t5JbryUV409NTKSYGYGJ9VHbzH6Xo/5FIW6t7L+pSk+JEOOq5FBPhLeRhOQqgzvEUooZwvYFn8eKDM2qxM9trmLOcXF3d0bLkCcr7tX+NS6Bl/I07jP4GY6OMXtc/bQG5X0egEK+FtBvhdUwx+ohFJFA0mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786468309; c=relaxed/simple;
	bh=rjwnMDcP8lzUaLezbQIu5trPA2QoWMepSHmJCqQ2fDs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=l6JenII+OErJBaIDxla+vLstB01HzbjYUHy/QG66Kg9nwbvEhew4tE6pmlsGrXHvQgiwYUnKzOO7F4IDiaf7ZRkMX8LIeyrqWwDRZD8W/QtG0wrhZbOrPqX7nVsa+AIPRR910zaVaXnDy3qI5XAQo6VcfE+5YS28b1QUx1gn4tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HdgMSiMk; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HdgMSiMk"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-476a130c138so23733f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 10:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786468305; x=1787073105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z+8wNfoOmHABTy4g+y7Z1zfdHSKXQmetmB8uqWi9o98=;
        b=HdgMSiMkOxEu3/xtpWBePm/WaAweXbM8EpTA5cEQr6pT933CWWkx3QVIUZslv/ajNs
         HH9twtNe5sQF2wf8NLL6aGMsDMMWjI3SohYoYjItrky3jE60KrAop4U9Xlu/e3ix2QRl
         dAHYDBozEjf5T9qNwlZq4vpEVeCPztw9P1gaRUZMDCVq93GtSzzO4H5MIg5dXSrXu6yC
         ZtfAyNgp2+XiajGyGbw2+2SwlcA/tdPKdsR4GmOT5X9NPV+3myOIpM8YM6zfsBL4QHwW
         LVw2uZ37Ll0SU3h4bMxhgx3HSzkPxkOkHV00r6zeI3B910QBtVyUHs8WjcB4zQhmHLS6
         gw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786468305; x=1787073105;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z+8wNfoOmHABTy4g+y7Z1zfdHSKXQmetmB8uqWi9o98=;
        b=eq8VYwFczTboJ/t0zbBzURSDnq9aUC3FqvmseOZ66Reljy/M0wIztmwheRna3Z5jHX
         SvQKqkEWfKJTCEBQw0dt2RXCjRLGhurIp+WvOyh9iFB770WngV5dPIV/7iQqibWukVTD
         gTdaXhDbTmAnk/HSvPnefknr+pfcrQtDNObK/1cqM8uXCnbsvva/UE8XDkKPcz6Qm7Vq
         0kwpmZGXRaKOnv26Y8xNrC6eKsHUTVj7C6Xcx/DGuvv+XzJYVwqzaCTW0tDFwQFSbQQG
         QUohb5WARBJjqSV863PqvwlmjkG8jsZFr6pGC6S0jMkE47b3JkKSSCwW94PSAM/a2Hj2
         KJ2w==
X-Forwarded-Encrypted: i=1; AHgh+Rplsjmju5DVJ7+Xbfcj0XaKZRv+yKQQLIl1qfZt06sZWWTBvFHGtfzKSFGk5pLEd0UWAMfIRR5sM3E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx41B4hwvY/7AodfMizSU9Xpi6rOfjx7xw5aAmxCkzXasbANpzT
	CB44SvzOs7vZDgx0vr0g7L8bbyDoQT4dHSy+pJ+4ln4CYaGkGs0ou30muM3UO/7AF7s=
X-Gm-Gg: AR+sD107GT30PAbtgQi2gW998yk7puOt/OPmlsdBgm1wDg+DD8sLzWsKUj96kwxWPFg
	VNtvkQSaWlk6y/b9YQFPNfH/Qd3j3sv2E1uLX7RBWGzjOudK/sABUwVajnYgi+Ru/DLz3NOR+O3
	Li8ZQyWVl7K4C6+6rqavxg+oDoQC08xVeb1R0z8QdHM5WHHu90QHoNAHK4Wa5MQfbKL7JHir6WF
	9YHT1uYRTXY5QUZKY+f0rHh1xb7VUpS3RLZA+apDJOVteCTCrXUA74FJrkcl01IAdY8ZUalJSux
	d9TuEK5CH3JQnzymNncK3TI7A3Zezjn1TvxFlCEdWaZEPd3XpkB+zkjIlOZk9dpA/e3a9epSJYG
	QlLmr8ZZz7SGPPSqp8nEPMaIXHOrCOAnqOMahRAdVgFG8dKPQqNKoLGmk+KpegU2lZBcdNO0XaM
	9NxscvBbFzrB3y9N0YtFOyAcjX3OxFFjpQPU/IDzYpw938PW0zGZa4XHm3b4U=
X-Received: by 2002:a05:6000:178f:b0:47f:8cf9:a12b with SMTP id ffacd0b85a97d-4814ad7819emr7011601f8f.6.1786468305202;
        Tue, 11 Aug 2026 10:11:45 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:b9fa:f7d4:4092:6a23])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4814a5ac6e6sm5889924f8f.6.2026.08.11.10.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 10:11:44 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MAINTAINERS: Add Brian Masney and Jerome Brunet as
 co-maintainers for clk subsystem
In-Reply-To: <20260807-clk-masney-maintainer-v2-1-c6d86245cf95@redhat.com>
	(Brian Masney's message of "Fri, 07 Aug 2026 10:30:34 -0400")
References: <20260807-clk-masney-maintainer-v2-1-c6d86245cf95@redhat.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 11 Aug 2026 19:11:39 +0200
Message-ID: <1j7blw60qc.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On ven. 07 ao=C3=BBt 2026 at 10:30, Brian Masney <bmasney@redhat.com> wrote:

> With Michael Turquette stepping down as a clk co-maintainer, this
> subsystem is big enough that it needs multiple people to keep the
> clk community healthy. Add Brian and Jerome as co-maintainers.
>

Happy to join if it works for Stephen too

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

> Link: https://lore.kernel.org/linux-clk/anW-jTldkWSJK3wl@redhat.com/T/#m0=
ae01b8dd23c452d82f34b61844a8305977a53a4
> Acked-by: Michael Turquette <mturquette@baylibre.com>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
> Changes in v2:
> - Also add Jerome as co-maintainer based on discussion in v1
> - Link to v1: https://lore.kernel.org/r/20260804-clk-masney-maintainer-v1=
-1-de593189a9a1@redhat.com
> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 07ffdec1c8c7..2c3c80e4761e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6448,7 +6448,8 @@ F:	include/uapi/linux/comedi.h
>=20=20
>  COMMON CLK FRAMEWORK
>  M:	Stephen Boyd <sboyd@kernel.org>
> -R:	Brian Masney <bmasney@redhat.com>
> +M:	Brian Masney <bmasney+clk@redhat.com>
> +M:	Jerome Brunet <jbrunet@baylibre.com>
>  L:	linux-clk@vger.kernel.org
>  S:	Maintained
>  Q:	http://patchwork.kernel.org/project/linux-clk/list/
>
> ---
> base-commit: 728e68a889bcf257b1e67298b12c360e5c3a13e0
> change-id: 20260804-clk-masney-maintainer-7b4349a0f004
> prerequisite-message-id: 20260729121640.3864006-2-ukleinek@kernel.org
> prerequisite-patch-id: dc8bae434144f43dd5ec1355d22ef9be3c34c9e9
>
> Best regards,

--=20
Jerome
