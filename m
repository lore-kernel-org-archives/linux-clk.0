Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686061F1505
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 07:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754895719; cv=none; b=ZVBz8auYId1Ai599Ih1ctmMSCX/ev6cJtzs4V6NVmPjsfqKfGc4YyagySdx57MP0WTKUMELp+Vfd1esHAz2nVqV4b39w1AHbMFuX/0uDQJ7kYMpBpUCRzbgLoPXfsN953QnPpgbXi0oJeg8lfjSgQoq1Ch3Go0soKb4iBubVuB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754895719; c=relaxed/simple;
	bh=i5i+o2f+rrl/OAOkHKuvWRjEKuAxEakK5GVIkg3Co6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hggxvVCY6feciS6OvESCwpdS7KREFqy6gljJDxU7UYMgPUl8tcpnjoVhlEzOndL1CbEjTtggUH+5fxoVaaohebYrW82FE1WEZZ29ukrzARx55l7YIXuN8q/jENXi4FAiKRMVKiWD8/DqVjgNALlzdPOGZE/M7VzmpmSlPpc1Htc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SZQz9W81; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SZQz9W81"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b429db71b3dso2548616a12.0
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 00:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754895717; x=1755500517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VHEw2IHzxA4wFPAA7C102H9OqGdRlerd4Wo31dulLWQ=;
        b=SZQz9W81/mXFsNxJ/m3ywX8jkIBpAonPnoei/q2JpUG5H5shjzuloeEut9f5VOTkSZ
         8HtUlOLiknpX9bxHSZM4vD61gZ+mrCfdAzka1joWQg0DaZ2Y2DJyoRjzzR1YiSlFnf8c
         FFPfVHfyjSWC1TWZbhntRW3MvERT286sVK5rNpwSF4qtlaYsVrFE063JIXP5ioKYeInm
         VvQjWFa8QcGP8pAWKtsn05XqknTOF/UIhkhqsDfxA7JGhgoCWzAJBvXbWmRhX46dR9BD
         FntrFGOsuiSC3CCgKdZxmM+cud8WuLuzGF/7dqphZQnTAQtyR1nOz7Cnrtsbe8IHdPCE
         G6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754895717; x=1755500517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHEw2IHzxA4wFPAA7C102H9OqGdRlerd4Wo31dulLWQ=;
        b=jweF8aVhuubEJ1wUJoUkfEMilvF+vAmjllBxTN0x/kankA5TDiai67ZGP8WoPI7kx2
         XFx+joFu0P5Fpb1SZ21WpLtOtwbPJC4++6P/cWcu/xxLwQM1Hgw57KFw+iqVynkn2rOI
         vxXWC1ZmYAb1W5X9uH+VdL1F4ewFDytsMn0dg3bjPgxVbcUN2yz0fvhAJPHBhW1F6+cO
         LRpS9JOtq+Pkjb6QOJt3ntaJEYJ/axcholuLnd5AFJfCuDXq1RX3V+AmJghf/+gZHBCC
         x0WrXZxc9whOrEKXFlf64yMY3+k0W5usST/Yri0FXf5eDDVtE5oV7ld3xXJKMryBkzoS
         Xv7A==
X-Forwarded-Encrypted: i=1; AJvYcCXikXB6jGHG+hyAKPUP+LVl1KPnq9PPrcrn6ptpSvbQSzqPe16t2fn6lqDS7yF30fzgPCs3CKHn8lo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDB47o3JxqL4EirocGsZojNEnO0T94+RXmF4SdbAPjHXUTeOj+
	CNqTdKk938mxI9raXUkiVgTPuDMSZRJOVRHeAClQxz+e6IPSaMJB9TDyK4ROQpYG0Qg=
X-Gm-Gg: ASbGncvRSk8htagzlIEm9hdpEp3hfQJc/oFCDuU7BB2TOFtaVpKu1/Blh8/7kjTVuO3
	5Gmd6/yWO83ipuUfeJ5PxFZvwoY7I0I+kVAZyBKMFB5BETtvNr3IBz5EV4yZFeZwK3jfT/5bEwf
	a508TNbsuw858ZsucnSmceju9vDOKhbIdZfNEhOZYUGaw2gLUaYqlKiooOfhmPNkCujwT0iYg/C
	zW9AXjPSTIyEJyQ6Jt3w0GMem/Vagclw0wHb2EJ4Mn1tZmqmiyDoNjzstfyjfTpfD/cyKRPG20o
	IdM3P1TEHkqzTJchPpdXxXNK5OT3xC3TMEKSR7jDRD8q8Ak73rY8HQgfU9jZL2e8Gtdone5epsa
	4PpyZgwn5yK5h9AzKRMZspD+myEel2mjTxWk=
X-Google-Smtp-Source: AGHT+IGfBYscmszLcQ4WIVww+p90HeYYLjnd7VEGcPNozcJMTJpfpN4Si84n434k13+c6xYJKAYYSQ==
X-Received: by 2002:a17:902:fc4e:b0:240:469d:beb0 with SMTP id d9443c01a7336-242c21fc427mr199498845ad.31.1754895716651;
        Mon, 11 Aug 2025 00:01:56 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899aaecsm265961735ad.119.2025.08.11.00.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 00:01:55 -0700 (PDT)
Date: Mon, 11 Aug 2025 12:31:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	konradybcio@kernel.org, rafael@kernel.org, ilia.lin@kernel.org,
	djakov@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 3/4] cpufreq: qcom-nvmem: Enable cpufreq for ipq5424
Message-ID: <20250811070153.5rjj2cudgs7rwiwc@vireshk-i7>
References: <20250806112807.2726890-1-quic_varada@quicinc.com>
 <20250806112807.2726890-4-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806112807.2726890-4-quic_varada@quicinc.com>

On 06-08-25, 16:58, Varadarajan Narayanan wrote:
> From: Md Sadre Alam <quic_mdalam@quicinc.com>
> 
> IPQ5424 have different OPPs available for the CPU based on
> SoC variant. This can be determined through use of an eFuse
> register present in the silicon.
> 
> Added support for ipq5424 on nvmem driver which helps to
> determine OPPs at runtime based on the eFuse register which
> has the CPU frequency limits. opp-supported-hw dt binding
> can be used to indicate the available OPPs for each limit.
> 
> nvmem driver also creates the "cpufreq-dt" platform_device after
> passing the version matching data to the OPP framework so that the
> cpufreq-dt handles the actual cpufreq implementation.
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> [ Changed '!=' based check to '==' based check ]
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v5: Add 'Acked-by: Viresh Kumar'
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  drivers/cpufreq/qcom-cpufreq-nvmem.c | 5 +++++
>  2 files changed, 6 insertions(+)

Applied. Thanks.

-- 
viresh
