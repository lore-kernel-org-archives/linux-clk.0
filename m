Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DB91B7F4;
	Sat,  4 Jan 2025 20:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736023685; cv=none; b=EL4i/X8SbUtjrlUsyX7i2ugFC/+iM5jbupGSH0b5cSbRbo7zRghXIY52uu/iiFgH4Tlq90aC6pUAF03Q/FvfnJmMnFGEWwYZXYJgscwKgr+pbd9X/RPflDdsbKOZRWBde/5hbdPe8lSxj9yyWPQbfYxMkwzaoGLNF4+IEGbg+nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736023685; c=relaxed/simple;
	bh=7qOGU9lSGU7clY77Ut7Cvj8lEKcDAuiG7L+BWvjj5ig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h1tv3o8J42utPkes2sV1eSAnAC8nS1fOFCDOcDlXQv5AoP+XoVoyvpdaLn1rgesd3QPupQ1ast4dxB3HXp4a7m5RfghCPPgHIWbhhFjpSaM58F2WjGux4PiL+neV4spmM5vYPHzCOsnTKHfOWHHIqpevymAzr7Om5AQt3uEhZPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HIatiwSD; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HIatiwSD"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-29e91e58584so9059742fac.2;
        Sat, 04 Jan 2025 12:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736023683; x=1736628483; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qOGU9lSGU7clY77Ut7Cvj8lEKcDAuiG7L+BWvjj5ig=;
        b=HIatiwSDYtWt8QMLXgEKm/a6m+2IsA5JY5i8syMv50QnSa3VysWoMIEhKytwdH2zBO
         dzW0B8S5UuLBj8hZCAc8APx0phIbhuavjbG1IWwqAsmz4p1B2KChUwY0UzIP9xmBHHfh
         Zg3Ced9ZL6KAEIO8VUcFmimJgz7KQ2Y/8YzCW+RTY7c41IgxDzjX6mdanZaGeijSunhb
         Gi4xD2S9mF8/O64S3q0H+q1ffnWjfAK9rpc+UYlxTFTmJJGeiguxHG+TIdcF/snkJAAe
         cy6hr8fot4Mg83WD9Uk8IBLuOlpBwgZ0dLdkO+wHOgdtASr0hRwsDMBeIokl2aPBqkjY
         4AEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736023683; x=1736628483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qOGU9lSGU7clY77Ut7Cvj8lEKcDAuiG7L+BWvjj5ig=;
        b=HVZi0oMf0EDoabmobJA7HVw4z574vSoOjii+/9xWqIvggTwLhLzwyTk5SHUK1om+Ad
         Pmm0WcggRMPn1vnNOtZ0RbOlhpTJ4IagDAaeYUKjOtpa9+b7cFF3H/AfGLldIz/VYcJ+
         T7ZBcR3YonNLreSrStp+R3j6Ez2mTqKaUAL0gWnHI9jRn2zgfrDY8gNRkcWDM6ohC6cp
         up0kA3a44+sO0u/xUY/0Se6Z1B10wH5BpiLWMC12/2sn2T7lWNDm6SAYACgaG+ITkmx8
         Mn9PnoLgDJJTCEYxrP8eaBiInjTGdjCQ6Q+OhdcPnuK1j85qBs9ext0wgJULxqD8LHVH
         CMPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJqXjRTjNPfspJS0APNvM/mc1S2VFP8NS/Oo6JGzgsmN0VTQQRf2zaRVZYyF6LAlsPPcVzZHdoLgOd@vger.kernel.org, AJvYcCWM8mq/FhWOdLAjMccaumbQnp/6XItpasXN8Ugw+RCjmQnSueWm+mHzO6m5r/lpFjDdCTrMp68q53tQ@vger.kernel.org, AJvYcCXISUo/MusWIlWRqmPJtCNjxLMf4aM7jVOfDCc8yLShAF52gdDegemMa3aocNXQURvU7gWnoUJkzfywgEsT@vger.kernel.org
X-Gm-Message-State: AOJu0YzpIZ3RxZAIuOYu4Y1NyC9NVcDryisRsrRyRiqE1+yjmzcVYdcC
	SnmR9mz0K1j4BhUxlwBweSp9h3SUjaVulIasafYg26NvsQCskncIzX01uvWUI1wkTs3L6dt/O/D
	FiACWoNov2DzZgDzrlZjs09viIOY=
X-Gm-Gg: ASbGncvMQS2SQC0dVygQEz+RRIdITfKETfccTUlBF6c7ccFJGkhPSkS896JNJEZobfR
	pZtoWwn7HJNCjJtVkykhb2hcrqzPbwZnw+eYbFyQRg3DTNdM5kjTg
X-Google-Smtp-Source: AGHT+IFqdpx5RJdOsRI9uR/s22I3j6REd5BbLNXwPDGQxQawZM2Yl0ffyE3R+tpVxSAwvtmyO4+f1b43CRGilnVUCkA=
X-Received: by 2002:a05:6870:2f09:b0:29e:3d0b:834 with SMTP id
 586e51a60fabf-2a7fb00b511mr31315329fac.5.1736023683128; Sat, 04 Jan 2025
 12:48:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250104074035.1611136-1-anarsoul@gmail.com> <20250104074035.1611136-2-anarsoul@gmail.com>
 <CAGb2v66W9q-uQkepYgrD9QKnOwmpUdDakRoKjmsT_4=Adyj09Q@mail.gmail.com>
 <ca0cad16-7c39-4635-8f09-f9f3c95c9fef@kernel.org> <20250104120256.65511a28@minigeek.lan>
 <CAGb2v66h1k9Wm5Xr1NMYsOgV--2oaHrTfyVFmUisdKmsG1HBCw@mail.gmail.com>
In-Reply-To: <CAGb2v66h1k9Wm5Xr1NMYsOgV--2oaHrTfyVFmUisdKmsG1HBCw@mail.gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Sat, 4 Jan 2025 12:47:37 -0800
Message-ID: <CA+E=qVdm5gf2+TL6ThaTdBy_3jPTSYdU6hj9Om9jPS=iyv8wMA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
To: wens@csie.org
Cc: Andre Przywara <andre.przywara@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Roman Beranek <me@crly.cz>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Dragan Simic <dsimic@manjaro.org>, Frank Oltmanns <frank@oltmanns.dev>, 
	Stuart Gathman <stuart@gathman.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 4, 2025 at 4:14=E2=80=AFAM Chen-Yu Tsai <wens@csie.org> wrote:

> > Yes, IIRC the C standard allows repeated definitions with the same
> > value. And I definitely tested this before (and hence recommended this
> > approach to Vasily) and it compiled without any warnings here.
>
> Hmm. Didn't know that. Good to know, and I just tried it on my end.

Yeah, I don't like it either. It's an artefact of pretending that the
device tree directory(ies) is a separate tree.

> Thanks
> ChenYu
