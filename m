Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3738F14D428
	for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 23:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720654352; cv=none; b=Rr0fluFK+8Ht0DZ01nD7dh2V3fhYSBrC47ovaVP7hCMFDRCz6sZwoIcrU2Y1XgdNV2cpu+PYJ2sN1p77NlLqnSOCenVSmwMxMqHjcgs18ZkgTzUpeSPNU6zWbDKJxHlxh7iok3Bbm2ysfCWQlDpVd2ZnAsd2WPWL1SuIa1odaJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720654352; c=relaxed/simple;
	bh=4FdwsEGiRMoCwhHU6QcTg2CuECXzaFgQHhZDwC24/Kk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YxbaY5YmwY2+41huisyV3SozyGfhqI1azp1DK46PKMahdmG00m2ITB9342Vlr16FxnHeCtlRc/SKAi/JeoGBQU4fOKs9bVnP90aDGdi97snV8P4EzZt+4cYLmJlmneWIKsCsfjj5zNXhCELkMGPMR2LUqrgVPtmWI7zGZTF1Emk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TzTmjHKZ; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TzTmjHKZ"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-64f2fe21015so2734407b3.3
        for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 16:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720654350; x=1721259150; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=thSpgyoIxZwTvukwE7k4RFixN4nw/X9gAyNNLGSzrDE=;
        b=TzTmjHKZPrzD87yB9EefxCCkm8JJYCE1dBj5rT2a9i2kyg9aKGK4y6omqTXXfPMkdr
         CMOOR3bxpZK1d1JXvzshI52huB+nZYn2G02QEII31K6T5RnGvFD0zJXChnb8uJckEu7y
         t9Yv09o8acvIPbdEDV2H5SDfTLm9XAShsAiijyzNVpAP1lyBaR/CSn6ECi6J7+m/rJiW
         j+MmkxP21hfhLGcPlrimZPYImRSAtk4M/3GqMIpmECmVE6nRZ7YDRY/55ildr6XGvsH6
         ybGINoHLH/ikmXiWzHC4JlmpliKoNqhkQbV6yWp0wh/zvn0ih4m+j2gfYo0k2yQVnJhb
         kJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720654350; x=1721259150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=thSpgyoIxZwTvukwE7k4RFixN4nw/X9gAyNNLGSzrDE=;
        b=rtKNtf25G+9Upk/MIIsht45uxgt6fxKVyFwpTLQf/arexMP0kJZGK/JfIxSkoAAbbn
         efUNi2sZ5/Oq1ZcxDv0SvX+ILA9DBHIrUyDWAGxXW446neJh3uASuANsPc8WWKVboSd/
         M6IuY2EM9MQCwNuhhAijPqlNvx2eD8/qFhD9ldlduqPtYzHjsvxgXmYd2XaxpqKWOIfh
         G11+oommvRN84Bdrs3BU4iC3rrKVGM39UY6AGB3u+flwbsff640Iz7JDmj3t06SQfqQp
         7xQ0KnWw9oa0F+KQ5Bwt3mflHAsTe6VABvQ7G+YCK7Ubjv5ipqmLYhShj7U/+PkZN0PP
         tofg==
X-Forwarded-Encrypted: i=1; AJvYcCWcLFZ9b8nptB5zAryY9cYFh6NXvW6Tu1i+q/X623OTcHfPtWH2OnbcexIJnCsyZMia2sGxWj4aLZmm0jKB4KhIklAak8phVFdf
X-Gm-Message-State: AOJu0Yw6fxvPrD989rJGN7E3g6A7WhfVeG6fwqX74dBtap3Ki44+l19b
	JHqCI7BPSVapIbAfv1kYEM9ec/yxHgBKwrMkHAQeb5vru1TJxINPbwk3BdkF7HpKRqalN9Sc2f1
	zI7qtyyMmk9eFODShzk/ryiV/U730Fm79sf/RWQ==
X-Google-Smtp-Source: AGHT+IGgHYRsDbF+YAR3hcp295QaCBJP6niufixwn280tob0vpK4rOgKG8oJ2up/aO2xesPEbAh0L2iUITeWWszFyjE=
X-Received: by 2002:a05:690c:6383:b0:60f:ad5f:f889 with SMTP id
 00721157ae682-658f0fb3403mr100251097b3.48.1720654350073; Wed, 10 Jul 2024
 16:32:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628-gpucc-no-request-v1-0-b680c2f90817@linaro.org>
 <20240628-gpucc-no-request-v1-1-b680c2f90817@linaro.org> <5153b8f8a6c6ffdc1254e00c47a888ed.sboyd@kernel.org>
In-Reply-To: <5153b8f8a6c6ffdc1254e00c47a888ed.sboyd@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Jul 2024 02:32:18 +0300
Message-ID: <CAA8EJpqOD-JKGCJiC7yAkiG3oAOEbHQ-_aCmDiP5HdeEVZm8fw@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: qocm: add qcom_cc_map_norequest
To: Stephen Boyd <sboyd@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Jul 2024 at 01:30, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dmitry Baryshkov (2024-06-27 22:20:22)
> > The GPU clock controllers use memory region that is a part of the GMU's
> > memory region. Add qcom_cc_map_norequest() to be used by GPUCC, so that
> > GPU driver can use devm_ioremap_resource for GMU resources.
>
> Why does GMU map the gpu clk controller? Does it use those registers? We
> don't want to allow two different drivers to map the same region because
> then they don't coordinate and write over things.

It's not that GMU maps gpu CC separately. It looks more like gpucc is
a part of the GMU address space. I think GMU manages some of the
clocks or GDSCs directly.

-- 
With best wishes
Dmitry
