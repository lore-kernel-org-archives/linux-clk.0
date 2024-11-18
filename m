Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6F619AA5F
	for <linux-clk@vger.kernel.org>; Mon, 18 Nov 2024 13:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731935419; cv=none; b=qsazN5fJdBmbSeosIBRdAjOQqaRs28fo2pl1DQEd0fFh+zdv7quYq4kRnbZG1DYZEy1Mo6ZY/p2WDJHxqI/U6lEF1RZnJPLH8R6fzXbc1DOPWM458CyhM19ciY/ebnMDKyTkGG7WocYWZEvQ7O9j/45aQf92gy8F+g8QL+7zjkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731935419; c=relaxed/simple;
	bh=Qo3j9K87oklHHttMGW7FxuFJ5OAHNu0KyF5/pme2whI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPeBH5+vrl9cMFtOEjc8n8EVLIn7Syqtx+bko5hF3CDshqRGYPQMZbiyV5kVyhSfvrBCw5OZ2gQzmlAnn2ErKrbgRUQZHvafSdPtpYAI/RdNMIhzFyAOS+/bYsTZZa65RHbVxh0NMqSHGF9pdrY7PeXm4J0LsY81DEE6SSqhLLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T+PRR6P6; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T+PRR6P6"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539f1292a9bso4876633e87.2
        for <linux-clk@vger.kernel.org>; Mon, 18 Nov 2024 05:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731935415; x=1732540215; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7MgID1rDBH0q2g66wNaYzuYle0Mjw6YJwKmhz7O5g2U=;
        b=T+PRR6P6krZcprQwWVW9sBhWjtsWLzB22fYpopRtXCygX3tjByPwysgGA/efjagD0F
         dugHa6j6xmmeqIRqToFT92rX56DrZYomRDIS55wTbUF0aKa4abR0eFYZMQa5gjwHDAlT
         2kOPCteR0v31joZS43w76JUL/gLcPMpGVoKncEZVD9McZTv84UrFvQyAPfXRPZuDsJ6J
         lYOxHqEM+HxFBZDrrnWvfPBYqjhkVIlIAY8tyUpDkrA09XCF7/HC1PPEy8Zui5uvpfES
         jz398Y8sX/NdyvKNKhzeQM1qPzS5NXv19pQf4q9ReIWp/WAa/hwK3I5rS2f7nSxgZBdp
         ockA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731935415; x=1732540215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MgID1rDBH0q2g66wNaYzuYle0Mjw6YJwKmhz7O5g2U=;
        b=P6JF7UUPPYOn/SFJpwLbFEfGKevZGOJ9DrldgiLv6CpgUKq+TcvG/H13RS/Epy2m3t
         5MTPD4ksma8AObV3KJu4QplzLEj1H43ZSCRv3cx0EscIVk6OSXO76SKUeiRVdTo6pzcU
         9VXfE/hVhDyvV9A1+OkVHBbryOwA1osLxwo8C+4v+yLhVKhhbjRPC85RTemO7eDndz8R
         nog5RQlGkp0RUrUjDroORuIRRr+4Xqa2vRF7YXpf5ytbElZDwxd0hSaNRvKSciiIpCAr
         9uwhBHjNIVszJgRA6h2rYeLvdnD5OmdLDe++4XZ7rWPN8/ZFSytgvO5a9nqn1s6DavmK
         VjLA==
X-Forwarded-Encrypted: i=1; AJvYcCU6wACifA8TO8CQdy4LG2ML0gQAX8y9VihXLynykjjuw1dEVwBw8TYqWbw6URvTODWYpb0M2n3npP4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAZ5Y0pK5xNtqC5PH2/IXzQpO++1QEn7wTJWt2ptK7/D0FLi3J
	oMouWWAOO/wA/TDceH9e4/ksHkT7vANQ+VCPPK24rPZk6SFkSECLEBmd9tCgMeA=
X-Google-Smtp-Source: AGHT+IFp+UyivweqpjmdInjrNQsnahm8prNYSiTJ88LG9qmFM6mGU5RDHMsWJlSnsGNLGahvS/sWSA==
X-Received: by 2002:a05:6512:2389:b0:53b:1625:bcf8 with SMTP id 2adb3069b0e04-53dab2a71bcmr4913816e87.30.1731935415010;
        Mon, 18 Nov 2024 05:10:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53db3324b55sm685584e87.202.2024.11.18.05.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 05:10:13 -0800 (PST)
Date: Mon, 18 Nov 2024 15:10:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: gdsc: Add pm_runtime hooks
Message-ID: <atg6yw64f4aojcbjyarljb57cejqk56g2qnddrloa3smmupm6d@fk3oyiycnuco>
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
 <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-2-b7a2bd82ba37@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-2-b7a2bd82ba37@linaro.org>

On Mon, Nov 18, 2024 at 02:24:33AM +0000, Bryan O'Donoghue wrote:
> Introduce pm_runtime_get() and pm_runtime_put_sync() on the
> gdsc_toggle_logic().
> 
> This allows for the switching of the GDSC on/off to propagate to the parent
> clock controller and consequently for any list of power-domains powering
> that controller to be switched on/off.

What is the end result of this patch? Does it bring up a single PM
domain or all of them? Or should it be a part of the driver's PM
callbacks? If the CC has multiple parent PM domains, shouldn't we also
use some of them as GDSC's parents?

> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/clk/qcom/gdsc.c | 26 ++++++++++++++++++--------
>  drivers/clk/qcom/gdsc.h |  2 ++
>  2 files changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index fa5fe4c2a2ee7786c2e8858f3e41301f639e5d59..ff5df942147f87e0df24a70cf9ee53bb2df36e54 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -11,6 +11,7 @@
>  #include <linux/kernel.h>
>  #include <linux/ktime.h>
>  #include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset-controller.h>
> @@ -141,10 +142,14 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status,
>  {
>  	int ret;
>  
> -	if (status == GDSC_ON && sc->rsupply) {
> -		ret = regulator_enable(sc->rsupply);
> -		if (ret < 0)
> -			return ret;
> +	if (status == GDSC_ON) {
> +		if (sc->rsupply) {
> +			ret = regulator_enable(sc->rsupply);
> +			if (ret < 0)
> +				return ret;
> +		}
> +		if (pm_runtime_enabled(sc->dev))
> +			pm_runtime_resume_and_get(sc->dev);
>  	}
>  
>  	ret = gdsc_update_collapse_bit(sc, status == GDSC_OFF);
> @@ -177,10 +182,14 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status,
>  	ret = gdsc_poll_status(sc, status);
>  	WARN(ret, "%s status stuck at 'o%s'", sc->pd.name, status ? "ff" : "n");
>  
> -	if (!ret && status == GDSC_OFF && sc->rsupply) {
> -		ret = regulator_disable(sc->rsupply);
> -		if (ret < 0)
> -			return ret;
> +	if (!ret && status == GDSC_OFF) {
> +		if (pm_runtime_enabled(sc->dev))
> +			pm_runtime_put_sync(sc->dev);
> +		if (sc->rsupply) {
> +			ret = regulator_disable(sc->rsupply);
> +			if (ret < 0)
> +				return ret;
> +		}
>  	}
>  
>  	return ret;
> @@ -544,6 +553,7 @@ int gdsc_register(struct gdsc_desc *desc,
>  			continue;
>  		scs[i]->regmap = regmap;
>  		scs[i]->rcdev = rcdev;
> +		scs[i]->dev = dev;
>  		ret = gdsc_init(scs[i]);
>  		if (ret)
>  			return ret;
> diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
> index 1e2779b823d1c8ca077c9b4cd0a0dbdf5f9457ef..71ca02c78c5d089cdf96deadc417982ad6079255 100644
> --- a/drivers/clk/qcom/gdsc.h
> +++ b/drivers/clk/qcom/gdsc.h
> @@ -30,6 +30,7 @@ struct reset_controller_dev;
>   * @resets: ids of resets associated with this gdsc
>   * @reset_count: number of @resets
>   * @rcdev: reset controller
> + * @dev: device associated with this gdsc
>   */
>  struct gdsc {
>  	struct generic_pm_domain	pd;
> @@ -74,6 +75,7 @@ struct gdsc {
>  
>  	const char 			*supply;
>  	struct regulator		*rsupply;
> +	struct device			*dev;
>  };
>  
>  struct gdsc_desc {
> 
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
