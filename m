Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1DC3090D6;
	Wed,  3 Sep 2025 13:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756906653; cv=none; b=IZj/EmoeUrB5qsZmv5CcXLZGRc+fA2vdUt/AHxQaVJAzuhIuGdhnYZY1FPZ2iuiQpFVrtC3hbu3RQUhSOKjq8P/1gfKIW+MmfcHYqj2yduTtKbAivBQgQ0DWultubdz0zpSObXiaSkfRP57pWvF1umd46mv7MRSmQ/5D+umktQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756906653; c=relaxed/simple;
	bh=PbL/EGQbhxJhOitVzc5HwwJYAZFXLJWkRn1NxA9OrZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MDblBl9DcIsUa9V+HFCAt9+leplFoO2ayoQudKj+yAQT0T16O1R38tbbVtarykS9aWy+Jg/8ZVlLkc+Vg1CB+qcYKgOaMm3O8a+EVWn2BVUpSkCvNUKJxsu7BnFQ7mbNwn4cuF4EVSFt6oigB62OdfLBgA45lRmJLoty116Ssko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M9tWUk8h; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9tWUk8h"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-61e3b74672cso2186391a12.0;
        Wed, 03 Sep 2025 06:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756906650; x=1757511450; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PbL/EGQbhxJhOitVzc5HwwJYAZFXLJWkRn1NxA9OrZc=;
        b=M9tWUk8hyoW1jVinLkuWGnsl6Nidq0O7FT87bEqf/11WXbD/UYtj8LviRpRUX5wbrD
         j9oCRWKOTi1CmjTGKPKhLGoW1aaMAk3cJ/mfEI+J3wjqN1KPKq0sEsmgdsOq3odaA5ws
         c8ufjeqOlsh/4InA0rOzx0n3n1Mb2ING5W/BJhhu2jjDU1OpJQ9O3UPN7LWL9P0dkGFt
         ObUYgFtMYGfJn8lJ9mgF0AXLyQ0DvDyN+aZgDEItL2DHQnVBWWlFQ4wDK9XciyW2w3nO
         Dn6r9i9eKCx/g2eI/oyukJFga6dEMPA82O7vd+tCVg19Cy/iBudOAYksyQRgWIQyrR4l
         argg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756906650; x=1757511450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PbL/EGQbhxJhOitVzc5HwwJYAZFXLJWkRn1NxA9OrZc=;
        b=b7nBfM8CWn/4bAnviwtXVdeGJFbFPInoKhVmFkzUto7IoNG/ss3PNWOZTOJMygyKtM
         KEzzZe5Gkzd148Pges95ynI9Yt984wpNtjNLnzUscd5LjMAbL1JAJ2FTSiiYzvQ840oM
         5YrS99nZpgzFIyDmM799dTPm2B+fH8kfte75GD/M54shkdJsd+dqTuFXuDfPCOpT8fWR
         SqPUD/d2W2FquBZICZNK/tftJZiEAt+yAgzI09b0iDTgwvOJyZi9yF0juMP4YNCIkQm1
         lJ6Uu+n033ZGNS1X6TU+vphyIOJ5BjwjIFOOSejULwNMFiM1detOptQzXvKtQFFHMqE8
         YBOA==
X-Forwarded-Encrypted: i=1; AJvYcCUTrbO1uAcDBEXRG2xe/HWeSMQk5ElsemhJdbZ+LJ4ZNN+sR1X5gRwGMQlsODh/Cg1d8e+C81KiesGu@vger.kernel.org, AJvYcCWe2psiTcwJiFdJXXIypea2TyPz6BPdGliNfckzohHMQXBmhKI0E4ginAxP4TwH230Ac6dz/XT9yjmg@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1u46rZniY/Gvv2nwx19ahlXNMBe/o5FwxU9m6HOUUylwgVlwi
	KKQxPNYmE7nZl4xEa7M882gaI6niEc97yHzpPI0O7oK97XIpT3hPLFyWQ1WXvA6tkMimZZ5Di1N
	P8OmxUv+53qYjWvW7srjAtk5Q2UazxHo=
X-Gm-Gg: ASbGncudaU9Y4M3uU5HgwiVFr61nMdf/xxT1faB3sc4c0LMX68L8KcrRWI3un5I4A/w
	uSQu+x4rxmDkSB+QLE5BCY5GgA211GNQbL3o4/XQ/NOUVSnZXWZHHfw5TOWMqQ/ozrS163LHdOH
	dVl6qtL/D0JCPvrrV5WAKWSR0zH1/91zCqdlzx37dQReW4TEPIgoQBE/qxSY5hbib7/4H029p8n
	SnchJTDuToTjGPqJ0tAQ4YROefpQBZB+NbY
X-Google-Smtp-Source: AGHT+IHvQXQHTKEMoyFaTqaFVMbln/qgY7S7KV3L7ZG8Nf/m54vluMUEQq7iKiQYNXvspMMnhgUINllpQJ2XVCLCUPs=
X-Received: by 2002:a05:6402:3494:b0:61d:9a4c:d03 with SMTP id
 4fb4d7f45d1cf-61d9a4c0e7cmr11965634a12.13.1756906649669; Wed, 03 Sep 2025
 06:37:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250831104855.45883-1-cn.liweihao@gmail.com> <20250831104855.45883-2-cn.liweihao@gmail.com>
 <42028191.XM6RcZxFsP@phil>
In-Reply-To: <42028191.XM6RcZxFsP@phil>
From: =?UTF-8?B?5p2O57u06LGq?= <cn.liweihao@gmail.com>
Date: Wed, 3 Sep 2025 21:37:25 +0800
X-Gm-Features: Ac12FXx8u4DAg0EdT2iuAXVd9emM64ORc15VdHEwcPQcLyGaOTv-5kYx7yMGYWo
Message-ID: <CAPEOAkTjVN4auBj_CLrt0XN6SqU2=ogLjZDecEwGx00pixJNAw@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] drm/rockchip: dsi: Add support for RK3368
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, hjc@rock-chips.com, andy.yan@rock-chips.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Heiko Stuebner <heiko@sntech.de> =E4=BA=8E2025=E5=B9=B49=E6=9C=883=E6=97=A5=
=E5=91=A8=E4=B8=89 20:07=E5=86=99=E9=81=93=EF=BC=9A
>
> as a general remark, this patch will likely need to wait for 6.18-rc1,
> because a big update of the HIWORD_MASK macros was merged [0].
>
> So introducing a new user now would cause havok :-) .
>
> Also when sending a v2, please base it on top of that changeset, or
> just take linux-next [1] as a base.
>
> Also in a separate patch, please add the needed rk3368 entry to the
> devicetree binding [2], this will pacify the bot that checked your
> devicetree changes :-) .
>
> Please also make sure that relevant additions to the lists below
> are made (the binding contains specific settings for some controllers
> furter below) .
>

Got it. I'll rebase my patch serial to linux-next tree and test it
before sending v2, and I will also add the necessary commit
description and device tree binding information.

Yours,
Weihao
