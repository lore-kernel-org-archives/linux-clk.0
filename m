Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4373B0ADE
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 17:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791566617; cv=pass; b=rTGb7lclI4LKe7t6x4wYMP3VSQyDPO9E+ojJTTzp0NUfbNdIWEgPaUBjcwfwswzM9nTKW855hKPb99/JNEz4WDS6T7XA3ebdBeZRdA+nr1msezSBKmg6Kf8R4PSCP6BGLBUb0q+ek9mUOPMb4yrD4tB3pvqopiVr4T+Px7aFkcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791566617; c=relaxed/simple;
	bh=G2jxbatKwQbZzM49tr63rk6J2FHSq0Eo1YA3a+2vpVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dV7dRgulkAUEQOgAN4Ws8ytycJe+TkkGPPAe5dKDGgbTQRtJU/YUgCt9fETAFZmLRZJn3QoSdP7ub6+kPJhVF4WrxF6gQA4lL5aFJRS7vFgk8cvD4e91V2+ODY/UP0ypU+y30urKi260rxHYX9+gUzGyTFE5tpkqA5IKI4Wl5/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DcJNa8ya; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DcJNa8ya"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-679334baa1fso1075203d50.2
        for <linux-clk@vger.kernel.org>; Fri, 09 Oct 2026 10:23:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791566615; cv=none;
        d=google.com; s=arc-20260327;
        b=dtKfZqrKozYONJwdDFIU7OC2XkXLmu9dkrNnUAmLkoZ508PY5bzy0ZiZXSrOemsMad
         uvHNo3AmGayFtoumpxn18f4ZlMqLF3Mrrv+Ct1DxOoHxmVFbkPjWUbITgO2JNmIkxTIy
         qEYdwYVARQcMB1Pt88enhhS7KPWKJ+AiMN7K+QCQdWiC/yeXommU553ErW1KjpZd7y3A
         lJomHmdp3qhxdshEyUQT6GyyqDTI/jM0II1aNJZsbDSbd9gjJiNwFhS9JdiY/XnSkEyZ
         WhoBMsiZ09fG0j5B07euRa/02aVxvG3I3mrYDyMFemEeIP4+udrZicBg1OoiaKgxERI/
         YREA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=G2jxbatKwQbZzM49tr63rk6J2FHSq0Eo1YA3a+2vpVg=;
        fh=ZpgJV+C3Ool4g6rKmyzjgsVrWrt6VuJ8uUYbO548/gc=;
        b=oP/pQM5HvWsA3jaceq3aKBHLtLeeJHm1bp5pTAZj8+X17QEJlKc4QZrXZ8h3RmXWXT
         JITPVLgalNCH7aFY60qRawRcw1lMhl+s5PuvuJRmZzDxlSaoS0UBArnGjZACdBhE32u2
         phzkArc5Z5ILfKK3GfbCwhEBbmaE4Fu5JIgST/KzRY9reoN4Zs4NGlesHIMxM6kJDtjl
         aTDKDypc9ulJH438k472sHDYLbaXKoZ3qSZAzAkWcpPBJU1iRq8EdI8elVxJ3BcqHKPY
         no0QTmZ9pJd8xGAfLbKiPHXtKRI+O5Egf5jEwfCXOT8CSqS5S7C14pbywexGNVAPaQEd
         oYRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791566615; x=1792171415; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G2jxbatKwQbZzM49tr63rk6J2FHSq0Eo1YA3a+2vpVg=;
        b=DcJNa8yaRGkTNfc5n+yZJlUfiZiqIn7hfBJVpaV2A/uzuelRa1Q0IIhOLtQP4WUGpR
         gZOBUKeKNHPWCDb6ID0CANwB/aIfR446pSEH3KXl7YK1CUsBBael7zcf3btBXCXNidvQ
         0zZaNQuHOcPqjrj1CEzjgEyV/chixJe0kUpnZRIy3oj1x2H4IecbAA9wVqymQ+mXrWrz
         BD4UbqzePLfVuJAzQlWAhAYCdf1V7NNKAI/2gGLLfT2Sr3kWR+dkqhG3A7poHGNH4j70
         ELln9UTkS6yeMZO6jSXuOQ9iZzEKBOeqBsm/6voSaU+D9LGTVKDqILhQ6IORg/tOkBJ9
         g0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791566615; x=1792171415;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G2jxbatKwQbZzM49tr63rk6J2FHSq0Eo1YA3a+2vpVg=;
        b=JkPpHjf4kQSvIMQfKrSBwrqATT09Ya8T4vz3qX5x28pBQw4Cu6aDh9TdyJtBUNPTaN
         2qUMCMQxMl8Il3Bs+Iw22PgH2H1B4wNS2BZ7YATO73zzqyCh1v6x8/hxIv1WHHMGewDQ
         cP797GwlnQrBJb1morZqMJyyPX5GGxeGutfc/jTHu2KavOmnumjI07JGaT6gmncW4Oxh
         ZiV2ytwbGU5qqRkLtJ0qdOOEhOqhX0wxu1yKC+6xwuHNXabkGbxgCdTuBgXktx9x71FC
         Q8fkhek5coGCoBe0LMszCpy8DFkHmFNcW+nxuSfUoUlNqqAHyioj8M24WT96ZxLtLQeF
         gvew==
X-Forwarded-Encrypted: i=1; AKwUvBw9L43vO6FUnHOXZ+k2Lu5yoRZ6cVd1DrUN7O0qZRWoy1So0NabfVhbn/JEoqD3a1TetW5sL6ZqbE8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfRDommeRn1Lq2C+q4jCfFfhKNQiV+nTRtFGBcqpHGrBhIOmJ4
	GSQ2wxKdjn2wA9PKRbmLH0hhI9w0vpb38WYw0I8CmWRBD5OE3S2e0HoIzYa7kvUT0yV7POJ7+3Y
	wCesKDetBRwAZvRxJygmA2zMkjTHhFPU=
X-Gm-Gg: AYBFou1PA/7LhDNtrxRX1C078LVPARMVjegfFGiqLY6P5MkPIeLGIpS1aMUzlL1PznC
	6wnQiUt2tNml/3uUsHb9G67PXWgB4wXSxuE5h119fuwnrxutxL/+TKaT16SB54GMprnLGiev9RA
	y/bS4GdrxboqmykxcrdRTAB2LQ7Kw6EOKM5Ao7FekePg1wGY1oJXJW8ZoYYD7NvvgcRE/pI+JIH
	TtxrvclkX7DWCw0Gup8vt+xO1p3hyEkW5+lMuc2MceFBaRg19tOEbn0G9MIhVuAMUPjChobqM12
	oYp0Rl8zkiycN+7BhZrNMHHqjCUVmiVnlzE+xLcdvXjYyz0x762CEoKM7DDaBdNE6mUBy+tJK7d
	syj1Hdq3iwjPMwT9zRVY1Adg=
X-Received: by 2002:a05:690e:13cf:b0:677:d251:ccd3 with SMTP id
 956f58d0204a3-67935f20994mr785504d50.13.1791566614782; Fri, 09 Oct 2026
 10:23:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009070725.13196-1-ansuelsmth@gmail.com> <20261009070725.13196-2-ansuelsmth@gmail.com>
 <20261009-b41aedc4c5583a8a94926925@squawk>
In-Reply-To: <20261009-b41aedc4c5583a8a94926925@squawk>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Fri, 9 Oct 2026 19:23:19 +0200
X-Gm-Features: AclHuK9ImRwdPwJQHAaZVf0ijPl9QjRVdptD4lXqbW_LJijH32tMCETZU-OfmLA
Message-ID: <CA+_ehUxMyx-aejgcve4+naou=LQ8-OOSTPMHvSNVhCEiEiw3Vw@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] dt-bindings: clock: airoha: Document support for
 AN7583 clock
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno ven 9 ott 2026 alle ore 17:12 Conor Dooley
<conor@kernel.org> ha scritto:
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable

Just for my own info, what is the meaning of not-applicable in this context?
