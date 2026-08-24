Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ECF3F1ABE
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 09:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787563144; cv=none; b=lu74n096TpgOdGjdaKWxeX4c2uhzCHTNbI5J8Ul/pcs9Mz1pHOecarjOR6mhjAd4f1b6b1nlCyXrS0B/szLGCUiJwHbJDDg4LsXP1XzTnMPXNmJms6H5cbcIGU/nijabRVwWSBXEHaCZjaa5eOG1qhUVxw8ojXaQOnJraSGlK/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787563144; c=relaxed/simple;
	bh=WhHWUx1lkpZdwfjQMtwcJicNC0V9nwr/uenYypZhCYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o3Belug8ojVxL9LDlzvtTdvrqVz7p4trsqavLzKq6ZC3mOu16P1ABwzxBsl4w3iW9U6+Q5hUx6ic4RaxPXBAkW76vJTja4c5/nUrYS+QirdmK2mvXm0hluXrUdkzv3CxOVKbs6mruyyWhoQFzcn19d2rKQtZPRQsTCINDzV+/1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k7Y/vglD; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k7Y/vglD"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84e04df8c46so4281520b3a.2
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 02:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787563137; x=1788167937; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pbr5eP75HMWDjVi5kSReXoq3ufPagXFdRczlYd+lCws=;
        b=k7Y/vglD3gjCEfth0mkKgqegs6zsTYt9zFcg2XXRqGd0dE+5fK2ZfTvdDsP29NMMQL
         4jA0BZHwTZpE6Hb/JKvQjdOl4JQmAryVgNCSuT0O+zZG2ovd7oPat1cyysCy8R5Fsc8y
         ViSIHKA2q3suUqMXsD30WUrJmQSZv1EuJTPQGKy16N4tpscw6KeSPwi3WeSrepnxc+KP
         C+Lgx5B+rzYaScBH3SaNalSqnDkXL3QPt2ntMe/1kWZbzzGGkwrJ60k7zgPmhZzTVWJ0
         h5cqa82RynApl//DEixGo+fgHYAtsNNuGd8Y2AKYHKvLDmnd4M8IddRSV8pP+3SMM16N
         ZLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787563137; x=1788167937;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pbr5eP75HMWDjVi5kSReXoq3ufPagXFdRczlYd+lCws=;
        b=hUnWI5znNEYhukvUSyOwX1etVnixHxYUHW3Z5pG7LRNOW5984LyZvTg1EyC7lD8URn
         xXMthkUFwBRXNK7yedgpHkPypiqK+UjlKLWLRQHXZiyZVo1Za0T3IkunQba+TQCc+yyi
         dKl2vDHWfmyP/IeuW80fupsHBCqqQFdytBQdxUhX9KGA9e4hujGVNOAdU/JYNrBpMZ70
         PDvf9/pvNu1wPdquC51WVLF7Hr3sGLo+cG/mCDspXHjtA8EGxFKz0XB/Kyqir0ycE1ff
         KQb3DzDLQHdGNHZnXHvPJuB2MSzPSZiR64Jhh8D55tbzyhpM5/IrEshC04nKzW4WoBCP
         f98g==
X-Forwarded-Encrypted: i=1; AHgh+RoSi3ZIySrkq0aDE7PZXCo/nGpBy7IlBoSIJ6MnzhOcH9QRmW8JmVg3ktXdkYSjKMu6XH3p7t25EIY=@vger.kernel.org
X-Gm-Message-State: AFuF++lWAO/AOwXgfClNb8BIFti6A5IF7OjaZ2HRR/luPSDWGs7HA9hZ
	UxzbvUhu85d68F2yC9z5fxezTOJ0QLu5wZI4QWOumflNAPOnttsykZvkIILKBpxgyu4=
X-Gm-Gg: AR+sD10TsDi6rBRuwj8Fov1l2N6OHQREu/egvxaytOI2fd6fcBdyQlqoDB5vfY/9JR6
	pVxCmUt7iOgKUde6/jFnad2scUburKb3v8d1Em3jkco4s432wdrP7v1eKdbLxo1RkrW/dSOd0T1
	/4JV8svbY6bOqWOcTgrlwsEWQXlo+yFb7GG5jmtTlKZ6YpxdBxJLmuJylANIc1vjPHTnBJBVvDJ
	f8CU4Nw9Bl5U/ywVrZsQIWAbTAbaUpdwdzGZurV9PyWDdfFl7Dh60ng9mUAdGtslsG6PSB5gN0V
	/33r4fkBW9RG6sAZh49GBQ0jZ1eV/SmDuvbABLCKgr897vCQ1opawsIJ7nYEI6GALDk3xVsPjpY
	3pP2kORkIGKZcp2rW+3KM3IGs0ZDADUBT/6vL0mba8I4LvqyM3o+LucUFCfyjpXaXML851C832W
	xGp7pR7fJR8BropFEPjf+ZcPU7ULkf6/u+mYmFTuzbGNBZkiAeaFN9AjwUMxTJU99q
X-Received: by 2002:a05:6a21:9981:b0:3c4:1916:9d40 with SMTP id adf61e73a8af0-3cd2ffc1753mr40291706637.12.1787563132361;
        Mon, 24 Aug 2026 02:18:52 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f923f2c0sm36790685eec.30.2026.08.24.02.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 02:18:51 -0700 (PDT)
Date: Mon, 24 Aug 2026 14:48:48 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	rafael@kernel.org, konradybcio@kernel.org, tglx@kernel.org,
	ulfh@kernel.org, bmasney@redhat.com, radu@rendec.net,
	abel.vesa@oss.qualcomm.com, lpieralisi@kernel.org,
	quic_tdas@quicinc.com, danila@mainlining.org, davidwronek@gmail.com,
	mani@kernel.org, robimarko@gmail.com, linux@gurudas.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 12/13] dt-bindings: cpufreq: qcom-hw: Document SM7250
 cpufreq hardware
Message-ID: <aowMeGkWZQGmSmHx@vireshk-B250M-D3H>
References: <20260821154030.2514-1-sreeshankar0910@gmail.com>
 <20260821154030.2514-13-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821154030.2514-13-sreeshankar0910@gmail.com>

On 21-08-26, 15:40, Sreeshankar K wrote:
> Document the cpufreq hardware on the SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> ---
>  Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> index 98eb36bff..2dc2c265c 100644
> --- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> @@ -29,6 +29,7 @@ properties:
>                - qcom,sdm845-cpufreq-hw
>                - qcom,sm6115-cpufreq-hw
>                - qcom,sm6350-cpufreq-hw
> +              - qcom,sm7250-cpufreq-hw
>                - qcom,sm8150-cpufreq-hw
>            - const: qcom,cpufreq-hw

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
