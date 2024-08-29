Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345B5189F41
	for <linux-clk@vger.kernel.org>; Thu, 29 Aug 2024 09:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724922889; cv=none; b=qfloCw1tOp8mX8ci0Fejm2HvKCLfpyx7FZxGIZpqoHuPh1c+zca9nctdCsvceGGpHnll2GIstmyQYwvMM/HZ8XE1FmpiIu1AaDtCTmZZ1iDcB6SNI9AB7n96LYv5tdxenUjzQyA2z3SjpGfNWfP+iSSWfrIxjr+fZWfUCArAKMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724922889; c=relaxed/simple;
	bh=8x8g1e5x/vlcO20rV1E4Hnvc0w1vqyXS46cdQ7b4SyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mqn0kGF4c39ev0j5v/b1bQO+yrigBs7ifyYgPGJwnQg7T+NMWmmqytkoCOW/rE8LSywepndO+q/4Dr0W/Se+kBq19jqR3cTPG+EYCeEvKvIQjtITScQWb98/NdWFSC9jl5GDaxwiqeZp9IC+aGSG1IKULFfEilpY6KC8fur1zSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kbGJ7y83; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kbGJ7y83"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42bb8c6e250so453765e9.1
        for <linux-clk@vger.kernel.org>; Thu, 29 Aug 2024 02:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724922886; x=1725527686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L6Km23SekStR6cqhQyfp1JKUgaAiDVZuA409pMvIc/U=;
        b=kbGJ7y83gS6BzwroIpDOnz4hDdUthgdzD9yMiSJr3SwyJqMgMlcABdeda9MXLm+73u
         G12+ZKoqvrQ3w1VMsTstIptot8RyFKjf4bgeApH3rGubUgtzrHy9YhBgX76Fnpd4FfFa
         qLpbNr+ZXQOnOHIUj2JgMjCi6e3cWk4EgY8sBUfqJjXZoW5zDT1+iUg1/qjjCOUGKxA6
         jv3XtmFhLT0Rof/4ge9zL97lNP452EK+Y8qaUi8R5k1vXS/OfjfWr69rQdaVIgQgp9DX
         jXLmXWXnKwt8qbsb/t9QtC7ZwxXvVERtKSJyRnRLg+GQaSbgE1neupL3CVKxQxwHZCul
         gX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724922886; x=1725527686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6Km23SekStR6cqhQyfp1JKUgaAiDVZuA409pMvIc/U=;
        b=PAWsWsFiJLp+XCRcPA8xbFZhQee1EtOKOPkI26luOLdJcBbfl9G/6XmXxdT3xtVDi+
         YQ8m3c96m/Y0qnYIsFhLl5dX+bsVczj9leeQVoXQtXkRxqrhgpdHQoXncK4mQnYUChTv
         GEvzTWGqHTKdtKQQBykYB+gTnvexqLIQnejr9t3TN/4gbnCWIL4GlF5cfp2XKNJwBJ3h
         5FPEvqyP1G9vhT6ycSATd69G7e/D6yniUHkE/mEZRQAc9tVknmY25FQ+sJ/p5d1HgLeM
         gja9M7a0s2Y0lg2xu1I2h2mqnzG1/ty3LW9g6qSyfjqhGW4p7e+BYRivydCkYFqMirhQ
         Ms9A==
X-Forwarded-Encrypted: i=1; AJvYcCU9vwid/8z1TzZ7oC+Pcnkbx2xiAfVlWMiQIpjGZMQJHwoauWUiFdmCxGBN0fKjBYlW5nLyM5zD5LU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1oMW3vMvRIYgjuXXQa/YBizeSHG7/9hUZDBzYNrzLMwgEfVU7
	pvYYJ9zh0YDc0aMwNW4gt3YN+0TfW6tuXmJQW94M0iqTm5hFAX23ypqRHcBW5Cg=
X-Google-Smtp-Source: AGHT+IFs5vufPyvUpn6eMaWbjuz60f0gm2UsD8ZCjTHIvs2WILqyr59d1WjjUYCqBNLm5s2UJUeBYw==
X-Received: by 2002:adf:fe8b:0:b0:371:9426:d534 with SMTP id ffacd0b85a97d-3749b549687mr1435576f8f.18.1724922886387;
        Thu, 29 Aug 2024 02:14:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba639d440sm44969225e9.13.2024.08.29.02.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 02:14:45 -0700 (PDT)
Date: Thu, 29 Aug 2024 12:14:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	kernel test robot <lkp@intel.com>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] clk: qcom: clk-alpha-pll: Replace divide operator with
 comparison
Message-ID: <feb9dcf0-0249-41b9-bad0-c988ad2e45db@stanley.mountain>
References: <20240813094035.974317-1-quic_skakitap@quicinc.com>
 <4d314b61-7483-4ceb-ac72-10dbd7e4522a@linaro.org>
 <7733a4ca-330b-4127-af12-33f376fbbc47@nvidia.com>
 <kh4diauo5u63mldchmd66pbnqxwnbqfoqcpxsw6wwocbadygvz@3diccu2xt4kj>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kh4diauo5u63mldchmd66pbnqxwnbqfoqcpxsw6wwocbadygvz@3diccu2xt4kj>

On Wed, Aug 28, 2024 at 11:44:20PM +0300, Dmitry Baryshkov wrote:
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > > Closes: https://lore.kernel.org/r/202408110724.8pqbpDiD-lkp@intel.com/
> 
> this Closes tag must come after lkp's Reported-by. Please also add
> Closes with the link to Dan's report.
> 

No, this one is okay.  What happens is with some Smatch warnings, the bot
sends the email to me, I look it over and either discard or forward it on so
we get two Reported-bys for one email.

> > 
> > There is also the above smatch warning that was reported.
> 
> And the Smatch warning too should be a part of the commit message.
> 
> Last, but not least, as it is a fix, there should be a Fixes: tag and
> optionally a cc:stable.
> 

To be fair, at the time no one thought this was a Fix, just a cleanup.

regards,
dan carpenter

