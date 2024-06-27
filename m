Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5E4198A2B
	for <linux-clk@vger.kernel.org>; Thu, 27 Jun 2024 15:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719501301; cv=none; b=gBqq2osntTjkWVAckcIo8F2o+Oqq4/Zwwk95OfD9qTMNHpQLc/AFzGP7CkQEssybSxbpHifrxJGL68ZZT7aDRsqmmQGn6bOoOPAg9oz5m1tYWquWBxLB735GQ8OxXLLBdcfeoPvTx4CQOeltrfULSyOwYbPIB2THZRAuUXq4Yec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719501301; c=relaxed/simple;
	bh=8eem//ITjEXYdm72pHz9iK8ciJdXphch4zpUa3zYnNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HiDqAuRA7+qHnGxM5W5VLXLMne2ccNtAFhGKezuWVIZBDrGd15qb8ZcplUVN90SEROf5CQarwr1tw7X8Zv4xPCZme9E/dMgVf5YTEvwP2GX9eLW4/6LkCSNKeVPsDRP6CeUwHJ9h/S467ERWJIGBM1jUxOYkozagftiCjn90oY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PL6/Oc/E; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PL6/Oc/E"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-64a6b66c1adso1245107b3.3
        for <linux-clk@vger.kernel.org>; Thu, 27 Jun 2024 08:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719501299; x=1720106099; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+hwRyUjzUUY1CTiMvK15nbjIjb4MSnbZcFsEElNFFbM=;
        b=PL6/Oc/EkakHVxHkrw44QdyTe1Ir4u4V2a1mTaekekOgKyGTSn1ru9STNk/D4aVChX
         +z0xcS6PEm6Hoqhug0jK6OsRvbygxnFz3uVgAGiOnnWR2wrxGkt9zyunMOFT8qPlwH9e
         ZxsZAJqOmBkVCL6cwn6pvn/MGMJ9WAw8qyazAyu0T2wfGCvVd5T5gNE2NXEEzGoARGjC
         1S2AhT102+qMRqsqvas++27E4+pyVrgfaU+wIC/4Pl2zqERdnMg8wLpi74i/hnvrPBSs
         VcCveeukCFaCDlMYOovzsVDH9rY7B0/lLSspVQAWR1J2RyhSyrZJdI280YS8gB7Ypzmk
         yEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719501299; x=1720106099;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+hwRyUjzUUY1CTiMvK15nbjIjb4MSnbZcFsEElNFFbM=;
        b=oupbDEJC/VbV8CwctGKA3Ratg3wcZudBed0hzI+Ou5Uf0qOhUi6XS9tv36zYtSOkoy
         wykvmM8YMpwx5rDxFkLh9ajEfWdj91/NHHYfIW5K0MovKMYySWWieKYcu0lconW8hj8n
         /nQFFF3SBkr9XFRKAmA9CJWN4pIgDf17qJOM82eR3vTpw2QykkCG5QfU9QgF8YhDCEN5
         57scVTi0AAZtsE4YkIU2exaS9zFpWqtQmasuF0g8uakbAxhBmWB+sSVZsZItxCIzlHtJ
         xvKKBA8nmbd4V2Q0bdWosEDx4qM8DR8dpcgEjG3/2/N+abEhMffQMPTtnIY0X3d6eP0E
         cKyA==
X-Forwarded-Encrypted: i=1; AJvYcCUntGLqF9T7PEnlP4+OJlmT/1UHjONBSUpforVoNRHt8HsojKe9pdDdZqr7R4+EUM0I4yuIH9iQvCt4MOzRnXBjum5A/bAZZbwU
X-Gm-Message-State: AOJu0YzrXOh88SC5zT81YVvqDWKzTdASpNkB6B1JlqZe8eZ7R63YFNoQ
	/SB6O920vxcJeDzW5xkdcQXxu6x4wnzs2RLtYqPqoQ38YCTM5pVg4R2NSWmeE5/6yBChDDnxNZo
	w9XSt7ZvL+F1Rp6ATiW6atQlelRc3YndzcrEdUw==
X-Google-Smtp-Source: AGHT+IEIdj5kMgp1wElSphuCogD/aifBCB+hXxrUP1eZ9IZ1k197mI29RMs431bOzaAjpNxukowNArLWDrSnNW0Js8w=
X-Received: by 2002:a81:9e0b:0:b0:62f:945a:7bb1 with SMTP id
 00721157ae682-6429c6dae8cmr154073967b3.42.1719501299067; Thu, 27 Jun 2024
 08:14:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625070536.3043630-1-quic_devipriy@quicinc.com>
 <20240625070536.3043630-6-quic_devipriy@quicinc.com> <2391a1a1-46d3-4ced-a31f-c80194fdaf29@linaro.org>
 <69126dff-fe23-48d3-99b5-a2830af52e6a@quicinc.com>
In-Reply-To: <69126dff-fe23-48d3-99b5-a2830af52e6a@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jun 2024 18:14:47 +0300
Message-ID: <CAA8EJpoAKJqDH1z44_93kYLoAeAZ30TQe+=4ty1UgMydLUCxJQ@mail.gmail.com>
Subject: Re: [PATCH V4 5/7] clk: qcom: Add NSS clock Controller driver for IPQ9574
To: Devi Priya <quic_devipriy@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, andersson@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, geert+renesas@glider.be, neil.armstrong@linaro.org, 
	arnd@arndb.de, m.szyprowski@samsung.com, nfraprado@collabora.com, 
	u-kumar1@ti.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Jun 2024 at 08:37, Devi Priya <quic_devipriy@quicinc.com> wrote:
>
>
>
> On 6/25/2024 10:33 PM, Konrad Dybcio wrote:
> > On 25.06.2024 9:05 AM, Devi Priya wrote:
> >> Add Networking Sub System Clock Controller(NSSCC) driver for ipq9574 based
> >> devices.
> >>
> >> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> >> Tested-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> >> ---
> >
> > [...]
> >
> >> +    struct regmap *regmap;
> >> +    struct qcom_cc_desc nsscc_ipq9574_desc = nss_cc_ipq9574_desc;
> >
> > Why?
> Sure, Will drop this in V6.
> >
> >> +    struct clk *nsscc_clk;
> >> +    struct device_node *np = (&pdev->dev)->of_node;
> >> +    int ret;
> >> +
> >> +    nsscc_clk = of_clk_get(np, 11);
> >> +    if (IS_ERR(nsscc_clk))
> >> +            return PTR_ERR(nsscc_clk);
> >> +
> >> +    ret = clk_prepare_enable(nsscc_clk);
> >
> > pm_clk_add()? And definitely drop the 11 literal, nobody could ever guess
> > or maintain magic numbers
> Hi Konrad,
>
> nsscc clk isn't related to power management clocks.
> Also, I believe it might require the usage of clock-names.

No. First of all, you can use pm_clk_add_clk. And even better than
that, you can add pm_clk_add_by_index().

> Do you suggest adding a macro for the literal (11)?

No, add it to DT_something enumeration.

> Please correct me if I'm wrong.

-- 
With best wishes
Dmitry
