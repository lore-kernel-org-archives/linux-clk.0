Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5439818CBF5
	for <linux-clk@vger.kernel.org>; Thu, 29 Aug 2024 09:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724922418; cv=none; b=YsnjoSdDGzqa8k4sSVfuGvTlHRM5cTMBSHvQYB/t335aVN+EkvvnwQJxDbPSH9WG2jGQvd3Jt6Jtn5uWbfP5a2xZHikcnaxMDx0mq5IHRENIsxTTbn6KtOO0RZ7sOVoTs8p3g2fKk3RmpvLO/rDfb0pE9Ee2eQf5hs+VA0Jyhig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724922418; c=relaxed/simple;
	bh=7eXz03uhw8DoH+SK2GO8uzlMczYV3nCsPFtaNJ0YIbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S7kt0jfJ6WU3HE4mXt/aita0/5JKL8tE0plbmsaHbYygXiuepszGyiazaitwp0X9SkhHQpDHpCfByKrCxotDYVlQbpuSDE5KJPpfvLwfNagyXEAJzuKPOCWSIPBb2OtdbOStOv5D3NLEo4NEjn35+0TESz+2vi6dpS84Qk9sP4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jobFx441; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jobFx441"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5343617fdddso722623e87.0
        for <linux-clk@vger.kernel.org>; Thu, 29 Aug 2024 02:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724922414; x=1725527214; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d0i+1aeEGq4rgf/d7rFiIlGkZZYQ3MiL0C7dIbTMOJs=;
        b=jobFx4410Ah+jCJKqR6V8zPUn6tzxhbOakmz0hNorb4kcNp4vSHCXbaS2ZpvSpInKQ
         ibEixe5WB4qG+r9tpbUJEDacwIjTIND/X0M67pz742T8Hamhia2BuspLdK29Z+1aijX1
         vbVtSdl7Y/kSKxU8+k4v+gz002RgVGkDattA90BsG4lAn7o4eEbfzBs4TCX08jDcPl44
         xsVF7RCQHvLPwVcLQVEXcgpgiYwqUInOowklBgmwpnBuCkq4AD4sFMJTkmMxjfXDXUpa
         vLdU4C1QWXic+iXs7EuQbZ7e2gNrd6YtOECgsggpSEGlTHsq4y1x43xkPXIPATqxn+QG
         o7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724922414; x=1725527214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0i+1aeEGq4rgf/d7rFiIlGkZZYQ3MiL0C7dIbTMOJs=;
        b=PCgc1GpLKqU3QYmJqYAMXZi1uax2tzUc+xbRjAOpodbfVxVvDahHOkHcW0M2amXfO3
         4Ox+K+2m+xSVutZ/GMt7K6FdvskjMgjzOYjKZZ37U4FGrQdOEysnAwrhwzbdvEMZE2Iu
         8uT3608CKqEHVh/+O8bwfU8Mgh03if4mbIlfaYXbogcfRBemOcwuzg/dbQ5/UWbnBu0A
         3NgllzE2R+mNH7yVcozoD2WYCxcVynqv/HA3Du2Pw/Ixje4AnbNnGT9yAGnFMOgODLhA
         0h/BI/RmaYAR9XxAHqYCozmr0khq/NcL3IOpekzgQwJ/V45agNhpEBygx2trgWilR2Ng
         Cjfg==
X-Forwarded-Encrypted: i=1; AJvYcCVeH69mymmF3fY8niARGuxzhD5kZiK0Ye2oYNReiHoWwiiUjdUF0XxVANw6yZ0lKnbeP1NA7FCWmiM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYSKD8kuaj7dSFAdGPW1FCWglhhIUIvAgDLAyDSarywO7kmHL2
	JVp6oJ+aG7TNzkvoyMl5UKSd0wkfj30nQMtZ7U/F0HEtnfyXW2BQ8kjufNEto5I=
X-Google-Smtp-Source: AGHT+IFZAFiajCRKvVrZMT4gwxiPYEf4yoRnz8sc8Qm/VbyG8AogZfxmVe8CJ8QJj3rL4C+Jh1L22A==
X-Received: by 2002:a05:6512:2309:b0:530:dfab:9315 with SMTP id 2adb3069b0e04-5353e54324amr1735621e87.10.1724922413711;
        Thu, 29 Aug 2024 02:06:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535407ac454sm102192e87.103.2024.08.29.02.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 02:06:53 -0700 (PDT)
Date: Thu, 29 Aug 2024 12:06:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Yan Zhen <yanzhen@vivo.com>, andersson@kernel.org, 
	mturquette@baylibre.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH v3] clk: qcom: Fix error checking for
 devm_clk_hw_get_clk()
Message-ID: <alrspfbadwth4v3f5q4nstjm5phd7ttqxyxx24lyye6lpqclws@v5dfuc2fsp54>
References: <20240827025252.3512746-1-yanzhen@vivo.com>
 <9ce5d7b09b5358c9190d8a999d79de23.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ce5d7b09b5358c9190d8a999d79de23.sboyd@kernel.org>

On Tue, Aug 27, 2024 at 11:18:10AM GMT, Stephen Boyd wrote:
> Quoting Yan Zhen (2024-08-26 19:52:52)
> > The devm_clk_hw_get_clk() function returns error pointers.
> > It never returns NULL.  Update the check accordingly.
> 
> It can return NULL if the 'hw' pointer passed in is NULL.

No, it will crash:

        WARN_ON_ONCE(dev != hw->core->dev);

Furthermore, clk_hw_get_clk() also doesn't have NULL checks and will
crash if NULL is passed as hw.

struct clk *clk_hw_get_clk(struct clk_hw *hw, const char *con_id)
{
        struct device *dev = hw->core->dev;


-- 
With best wishes
Dmitry
