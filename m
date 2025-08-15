Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6CA299A83
	for <linux-clk@vger.kernel.org>; Fri, 15 Aug 2025 07:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755244304; cv=none; b=kxnfxT75DAdTdwmlNi+EXrDYfZ8J+xn9M09DxIMSGcfVK99JP3sov9yiHhEbg4uezVF+F7xOVhXUvy6B4asiH4BFUkp9GE7PtDN9jaMVr3o6lgggZQ+7cgRLEEBoO4bf1kIf6kD3s7jXd8I7546veXZxVzT/Ubj23KGUEGwPN/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755244304; c=relaxed/simple;
	bh=wM1U30RQbt9hBouuD0ezUDPgcheiH5LPKBmgTE1Ky2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMxCaS/RC8VIndEuZBeK7wWl9qFDTJuDF6Z0rBWyuDIA/oMrgDZJ7ukDFEleKwpPPPJzv+xlLn5CCYEuiRbDk2+qRPY+/0/+iAk6Ms92iQlgiukTj+tHvQwNcAgGmQ6KHiEK7zX4/qzXHKE31Q9j1g5tigZTuSojvV879R+VKII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cwK3dEm0; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cwK3dEm0"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b9dc5cd4cbso1264698f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 15 Aug 2025 00:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755244300; x=1755849100; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7m6KRZ644lLKsPQroVf0XIC4bXSKC2MeWxzfY2tyrfE=;
        b=cwK3dEm0J8ToNAu7/73elVZ2CRHijlXZxaEMLdAUAjVM4OWcJNV1syrQWrOlBIqfj7
         O2kRa/P4sKSQByEKMyt1pwr4/8Dm58L+rLc5mYiOsUCx65kNpuKw6GbuRvNkrHekQi/q
         /P0OFVexU127j+w3XftVsN1rW9hyjMY+qYop6VUI7tkMDZBywEJ4P9XVFkmK39SeT4wS
         UvKy+FcfutYMwXyJ/ze3yIuRuDcadiqsDjSQpO1NAPZkrpTef4B3dWyY8LkyuP1Ve1+T
         +ALQi64bcegzIruddJYTlD/njTkqORezTOF9qiwzIiGmUZfikTl/bb561kTi2ZCzTock
         mu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755244300; x=1755849100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7m6KRZ644lLKsPQroVf0XIC4bXSKC2MeWxzfY2tyrfE=;
        b=mtGmBPd3dZQ5xInygX/zTpYfG4DdZUDDDJr/k4ueFnakC5md88zmmKcWlFUBXvQF3E
         VNitGDGg0jZrFA4fjYfjQA9ucGcF1tWlWZ9YWit1oPdO/D9UOyzW40Aegh1etRaemdzd
         g692GjeXg1X6eCe/wmiZ8Ce3Z2CoCBHlsZ1CS+9W8/iW8noXdc4goNmrkeB7ZSWbOt0f
         n3fWXSerQU0Pod4QRlaNfkuX0X5rVgmkFX+EOrk02Fe4eaUVcz2S+uwddH0OBpuNta5m
         9R7dgkPLs4nmyqOoL79zrLIDmOZwhwOmB+h3rf0jN/OXUrr1YNihg831iKSOUFr5GGTz
         MK7Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5NAV7T/jVOfG9h0Av4CtSkXy7TB1yRAaR9Rj7cCQvMPJkIxcarxzl/Bz0GjqJfthLfY/Bj7jfgnU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0j3u68Gr8mK2ryT2jUXKK/9vdjUSRp6skld7gfOnlRPzwq+mF
	FMtOARPDFVZ7UNmdQ+Xuq300ZW5u5k9rVBL23CZhdlnG/QCnkUrF+siNAR3o4x80nzQ=
X-Gm-Gg: ASbGncsNuUdZkQ5301MJmY22NIxswlP5sQZX99NuDPQ3yIJdPeNAYBdKTBki6XEO/eE
	ZnlunBf4Y+G3obXxrFOUYnd8HLYhX15l/X5otUuHuKDaV++O9K6xXW396yerTS1aCN81bmaltwu
	7tmYcIqEzP18tb/RX29veiup5eiaI7bZZYEOPEJ6dYCWMF9enJ6EIEcRLpfFB9ckZV73jeZL9Ym
	P0rVz5oNTMW+lRMoXuqPyU0/wUwdM6rRftRFNHW0MOXiCoRRXO1dR7mk3yQinwjxjv2D77JMUof
	XIYwwiPVl9QnMFCowfQW8FbBpdQWaQQACwKXh2QFheCRzUzfH2yHVlvSU/WN2ESpUeCHiTM+y34
	4l7nznZwI6PwmvIzuUyKdO5F2dI4=
X-Google-Smtp-Source: AGHT+IHGaYmTmAXRjZNxgrE/I/LGdmAsoAt1BCBaN3PbkpwZZAN5Rl0gISUa4t157xbfeVhA78qhSA==
X-Received: by 2002:a05:6000:430b:b0:3b7:9589:1fd1 with SMTP id ffacd0b85a97d-3bb68fdc587mr833175f8f.44.1755244300612;
        Fri, 15 Aug 2025 00:51:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3bb64758d27sm1004077f8f.9.2025.08.15.00.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 00:51:40 -0700 (PDT)
Date: Fri, 15 Aug 2025 10:51:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] clk: conf: Support assigned-clock-sscs
Message-ID: <aJ7nCL0PS0DX8rtk@stanley.mountain>
References: <20250812-clk-ssc-version1-v1-0-cef60f20d770@nxp.com>
 <20250812-clk-ssc-version1-v1-2-cef60f20d770@nxp.com>
 <aJwnH2mlRdqp1K1u@stanley.mountain>
 <20250815071249.GA20726@nxa18884-linux.ap.freescale.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815071249.GA20726@nxa18884-linux.ap.freescale.net>

On Fri, Aug 15, 2025 at 04:50:42PM +0800, Peng Fan wrote:
> >> +		if (modfreq_hz || spread_bp || method) {
> >> +			rc = of_parse_phandle_with_args(node, "assigned-clocks",
> >> +					"#clock-cells",	index, &clkspec);
> >> +			if (rc < 0) {
> >> +				/* skip empty (null) phandles */
> >> +				if (rc == -ENOENT)
> >> +					continue;
> >> +				else
> >> +					return rc;
> >> +			}
> >> +
> >> +			if (clkspec.np == node && !clk_supplier) {
> >
> >Could you add a comment for this condition?  It's strange to me that we
> >don't iterate through the whole array.
> 
> I just follow the logic in __set_clk_parents and __set_clk_rates, nothing
> special here.
> 
> It is just like to phase out cases as below:
>   node-x {
> 	/* node-x is not a clk provider, but assigned-clocks uses node-x phandle */
> 	assigned-clocks = <&node-x   XYZ>;
>   }
> 

Ah.  Great.  Thanks.

regards,
dan carpenter

