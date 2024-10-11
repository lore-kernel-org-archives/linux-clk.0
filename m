Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C295820C47C
	for <linux-clk@vger.kernel.org>; Fri, 11 Oct 2024 09:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728638939; cv=none; b=UQGS1c3mozxmyiNVaHBLGWFarYo9equl/O4AzKq/7M6wqYDn0RzpQZUJihbKZzSRlnTfugaSSfbNFoZAhrbt5WFIJzXWxbqjj072i9mRwaxkm9OXxBjfvzyswO5zITgPg9NzNCc1yezy70DrqhJBMBKlIkE4nrGe/4Est1/t3i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728638939; c=relaxed/simple;
	bh=DltDeVYJEIb6wjca1o7bFaNWh22hJNIaTsco4M0fMzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=flbqtEWluQJ1g6/p8PfmjwraiCDK01E7YeCs3NUQLG9DPE3i5KGWD9+pVtfRYhjhSNWlVTbetyC9mSyqd+Un7szQd4JEUdmgFtI/barOJLOljJCOoTfzEgIKn1Ef+106U25ueQTUTZyJvJyj3cvU7AwukOEGcRUTjh6jyDThApM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G0JYwjVO; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G0JYwjVO"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37d4ac91d97so1340871f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 11 Oct 2024 02:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728638936; x=1729243736; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TCoDAR3p+NDgfps8OlJnbGKnp0R3MeEWSzHOxiQY0I=;
        b=G0JYwjVOmsppUfkGh2OByNk70IarIL6uyAStv2jEJCq8DSCJpanb7SMvPcYJ2/xyQ0
         JRkGBm9ZAhnVkqdjtlRFW65Ue4D54da5VSVwkHWjM9ueHeaZzBGKw5MvWGrPv5jvqxZE
         dmPfbKGu3x7r5btEbBttkfSncW6G27rdP7tvLJyRck0jT0yhO14Bya1azt4I/+AM4Tuf
         NfTHcdMeaWBZBgKeLiY5aPRORKuZ6Euu8oTOPRyvqQt0A6YOlYyW8Io47v7LKFi7OFBV
         gEpLGJQVY+kH6ce75Lx9tTsFe4NxwDU81okz+USANS2sEsTcAMWAD2Z7Vf9WxPczMSaG
         d8jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728638936; x=1729243736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3TCoDAR3p+NDgfps8OlJnbGKnp0R3MeEWSzHOxiQY0I=;
        b=tl9L74CkUc9NewzgVCuso1iagoO3cYJupbnLOuweq1fp35XBUHFn0g0o102ta/NXv1
         H+Am7a6Ej/BqM7kR/+oAYLWv1Di7mkdboh7f7ll8imb6cuCIifG5HReVdjo9nZZtSMQs
         dXQc67pjn1mRO8Gf8Ab9gVjC9mqeO+Sq24ubpziLsJuo2tDmKHWvkDf8iYd+PDs/HwGu
         zzEKrfdGgpc+Kj/DDO44H1I0ZWt0a5VkAUCzbI/LbVLnJNToKRjDa8qzsoHeqvNRJiRk
         ACIiNrfmSSWKULZXvcUUIz4E3j3el7B5SmfC/j4i1uFU2SMeRdtJGIc5vrBmmnlkUR+1
         TLkg==
X-Forwarded-Encrypted: i=1; AJvYcCVW2U2UQm08e9qvUliE8oOFnzZKOEEgcwJI0Cgg9OUtuPL7FFZnC43Dd9dirKTesAR3AeNFGd2qjkg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqB10qtqpwqF8m+09z9dO75xOip39ofKafLK+vkPcIHMQbEN2l
	XO/M0wOYFzQJIINDk4yHO9cEPdBKsaGR757FgQo9h+DREuYF3atVi5rB/W4Vue/0RS0s8mKdniN
	a6EWPdNUD17Mq5WLRtnPuIq/0sdv7F+Oe3B4IWw==
X-Google-Smtp-Source: AGHT+IG8wW1q8UJWHHq4y9KQZM4c6D7AmGKumiUzVkMrFvBY3yCJMkHghO6Wg3mIMaH1uDi6/A1L+L4KOCuGGEPI4z4=
X-Received: by 2002:a5d:5270:0:b0:374:c3e4:d6b1 with SMTP id
 ffacd0b85a97d-37d552ade68mr1496679f8f.44.1728638936030; Fri, 11 Oct 2024
 02:28:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241006-fix-postdiv-mask-v3-1-160354980433@mainlining.org>
In-Reply-To: <20241006-fix-postdiv-mask-v3-1-160354980433@mainlining.org>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Fri, 11 Oct 2024 10:28:45 +0100
Message-ID: <CACr-zFAT9tbmH+YUBLazUjzH+uyjeKSewpd=XFr3HBd7=jaMwA@mail.gmail.com>
Subject: Re: [PATCH v3] clk: qcom: clk-alpha-pll: Fix pll post div mask when
 width is not set
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 6 Oct 2024 at 21:52, Barnab=C3=A1s Cz=C3=A9m=C3=A1n
<barnabas.czeman@mainlining.org> wrote:
> Many qcom clock drivers do not have .width set. In that case value of
> (p)->width - 1 will be negative which breaks clock tree. Fix this
> by checking if width is zero, and pass 3 to GENMASK if that's the case.
>
> Fixes: 1c3541145cbf ("clk: qcom: support for 2 bit PLL post divider")
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
.org>
> ---
> Changes in v3:
> - Remove one of the fixes tag.
> - Link to v2: https://lore.kernel.org/r/20240925-fix-postdiv-mask-v2-1-b8=
25048b828b@mainlining.org
>
> Changes in v2:
> - Pass 3 to GENMASK instead of 0.
> - Add more Fixes tag for reference root cause.
> - Link to v1: https://lore.kernel.org/r/20240925-fix-postdiv-mask-v1-1-f7=
0ba55f415e@mainlining.org
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Hi Barnab=C3=A1s,

This patch fixes a regression with UFS devfreq on msm8996 (introduced
with the linked commit in your patch) so:

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
