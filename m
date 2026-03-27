Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FCE37754B
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 21:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774647224; cv=none; b=ka5XhfvV7deyEArPCzGrfObUwrCAXIpItOHzjdO2CZHyY4QGl0wWsciYkSq/r0NoVI/8U4DnBAaqCG/j/X+bs+wm/ivmMr9AM+0uKLBx3pr+MnMSyhuI9HwUcKlimfUd3r3Ov85Gl95Yk9IyoUqpp1XthScXe1nmzgxZrrIRPZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774647224; c=relaxed/simple;
	bh=G/NWZGW9c3/9L7BRd0J6hKFCfS3MWwJWicxI2gFlW+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YGetC73G5UmiMN2T+9VDm5DIPw20laUqtCQvwSi7CniSJIvLRrGfTzGvaBh3Z253UuKuqdnI0Pg/u+vkRam2HftYdsm3ySSKF97TMySd4BJM6rhrPwjoK/DGEdlyRenKFIb+f4P9uM142RC83seYusM7SKQBGZdbqHu4IJjAzZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VJWAoEus; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GgzZiX3r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VJWAoEus";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GgzZiX3r"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RKtPHj505718
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 21:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JkD5/e5PlfbVCPnIJK6O5WGSSIEFcuniRpfW4c/tKlE=; b=VJWAoEust9LgiZpg
	Z37KSkWXfwn034u+uMeQAxvjcy1pdYlF9dkLZrH0sj+69ppvwFu4brR0tv6PhN05
	6oBVFA+oLpSLZEPH4DvoK+HXIWTmW+fX7Bcrjl0eKH6w57mibQmqLqoRTe2+MLlZ
	3Sc6ADa0srhGyidf95VENQmYQMoMXQ41xdPWUBXqEjYIqREYTKAXTh5dF4Y0r0Ic
	h2Tl58c3MEALhXpoalXDumSnzdomVPv6bcKjzzrvB6fgSIlG4Hmnd2B6TPg7Bajq
	z4i6TAoH8kG0R0fD1sWUXFdT/T1Sf5C0xV7qhYl+Ze7incEuZFfCHHU6P+r5QFlq
	V8cUPw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5sxhhr25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 21:33:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50917996cfaso25503571cf.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 14:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774647222; x=1775252022; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JkD5/e5PlfbVCPnIJK6O5WGSSIEFcuniRpfW4c/tKlE=;
        b=GgzZiX3r4j4wwtk3QFmPXBh3WORITheoaX2xMaNdjyNyPxOdx+208m+tAjdd2jh8Q0
         P5Ms0FA4SezwHRmHesK8rvN8U7xDFiCr+HXFj9zvGzRZHmE4uDdAFZ5yjOl7BUh0ZcEt
         ZdHok44Hn0zRlb8p7r/Efor2kLUF7IjdMvcNAJiX4Z1Wo3LssBh5DF/7i7bayVcUpWP7
         nowX4aSy5QWliKdDFR3wPQ7J7i/SBlGxg2ZyLCpDgA3EON7yegRdgbugSdUwKDsB1SDW
         mwj1yXIbMIMDfLIU0Y3Ho/AXgSoqthWySoNJfe7UoqAB9RAXco2kbIusGKOCM76X5qGW
         vesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774647222; x=1775252022;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JkD5/e5PlfbVCPnIJK6O5WGSSIEFcuniRpfW4c/tKlE=;
        b=MlDc75+ElhTH5YE/2lssD26mh8tbNR5Lhfn6D77ID7iBBtsW79mzHzXIRpY56oRO8x
         bPbeg8n3u25bW7vXd2J8l78tL1qs+b+wvmIQgAIxLl4kGosQ8J7zHSYWbyWRNY1rw4it
         DT9axVSMgKJUmnLS8VoT7UHQtckw2Kvsz0qRWUCJ5SWN+89Us5O0gV+ucRUVi6vQ4eo4
         TkAaWmTiihtM+FCNUmOBOATnf740Cz2wdaIhT4SXerjUSp9Q87HF3ZwMclczEusJZ9v1
         gCN7ajKZqrleEbDNaFTdyIH5D5Gh6TdGm8sjEYxS5FpMYhgsFNYXb5Bs3/vVUZV08Tta
         T5TQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDzEYwdbZ6LSTD7dbUic1FW0g+DMy1igkk+bkPLTX719Mp+Y+3EV9PQoi/9MoyKMvs0yjHdz9xNck=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpbL1ygJq0bX4A024Yhx9xMpAt/vcvtwmHp4OpBHc9Xz/GJIS6
	9NqTl5ZJ/E8UCxTYax/1iXgiQa2U3rej3s+BulZP8PV9s5audLxKUUHFR3mW5VH/wyjWHuDx3OR
	H3sq+eU+yLWNSVC74/azV0RdSPGcKXFt532Dw079c3+gFf6LP5LHAW0icppW3Izc=
X-Gm-Gg: ATEYQzwf6OoGzMOqY1TZsQ+D3+7A4RJjlfsHhaKEvIu+0LlaeCksNVNvYOLnwlXVt7K
	GRlsZDi5sT46ltnipv3WHzWEUaVCuiB2UzGOIHqc/aC8wH7RLMpFxOoyyhAl9YkpQcEdCOtBkIZ
	fYM0t66e+KU4n/uYYIfjbUHU87sDEMTpD715kkcn1S2/MnuqGKjyFw3QPtOxAPtBAtA01hrpPN6
	pn/4e7rfxcmIWTEK5bsUzCYcvwMs50bA129JFMkB6jsQOLiwvtjoCaMG42xn8PqiED/IEToalNy
	dHHlS083HBBfOF4dQHdcIP85fy6W1hNjOHduap/lsjsl1/ugTVzaGgBu6wKZ6pTG6tID1IjRmBR
	neqhtNqu9p83tf9OyUxj+N5fi+gOb11Ca3L+uhhTL0eyebzk38iKI1i9Dz2KpihUgW2QgV2UZcu
	c68Nmlj9fMyCRdMUzs8u0NR7TdEJY32R7T8bQ=
X-Received: by 2002:a05:622a:1a9d:b0:509:1a36:6ad9 with SMTP id d75a77b69052e-50ba3813246mr54400981cf.30.1774647221831;
        Fri, 27 Mar 2026 14:33:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1a9d:b0:509:1a36:6ad9 with SMTP id d75a77b69052e-50ba3813246mr54400481cf.30.1774647221375;
        Fri, 27 Mar 2026 14:33:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13fd008sm40385e87.19.2026.03.27.14.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 14:33:40 -0700 (PDT)
Date: Fri, 27 Mar 2026 23:33:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v11 4/7] media: qcom: camss: Add support to populate
 sub-devices
Message-ID: <b7hndy63j2foc5iuly4reaunaorvg5asfgeza5ptjytaghc772@6jxgnimkcvx6>
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org>
 <CAFEp6-2s=N9=Z5A3gZZYo+XErBT=gMRHdxB7EQV71wPd3UqYrg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-2s=N9=Z5A3gZZYo+XErBT=gMRHdxB7EQV71wPd3UqYrg@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=QZVrf8bv c=1 sm=1 tr=0 ts=69c6f7b6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=8sstYimgJ8ds0kvrxP0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: tOvHoKvGuQfxkPX7YpkIRBslnWe8ezfS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE1MSBTYWx0ZWRfX+J66Sou0N3yk
 1d6GeLYrmRiC/0URqDhQ3zugRqmvVbtWjeVtdBBx3r0kSpLdEuUMgaQTDtYSjnhkoGGN9bUgQUM
 0rPFiHb2DZMW15ofuFENPa/CdBQNbZEGAkvzo7WaEEAR2RmAgryBKh4Ph6OGXZ5WRp4q0y2psXY
 sMrOZdO9OpsnnrCdtHIynfsHqXnyqprOvV7oNy/1r1M+zbB7O6J1Xv5VNRJjEqj5N3Hn/30HVxz
 OjBImYVcpBDjpHVFS/xxXTDkpEwgXGv8P/U5817VqskWboPiiupmpyRWghYIMB4QjutZHXuaKiO
 W0HnkG1+QAfOmgTJVbGjjMl8/RmReZOxmpAPRWVFXJNXFmL1etaafynQUTaWyI85u6GkmbTI1O7
 exVJsMcFhs/jrTLVAy7pmcYqZK28OY5lVwnnFSLtvFRoABcltdOEDZbUxdjUnYkLmTr0GjoEPm3
 jkuU/8hoRlYE6h2oshg==
X-Proofpoint-GUID: tOvHoKvGuQfxkPX7YpkIRBslnWe8ezfS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270151

On Fri, Mar 27, 2026 at 10:22:04PM +0100, Loic Poulain wrote:
> On Thu, Mar 26, 2026 at 2:28 AM Bryan O'Donoghue
> <bryan.odonoghue@linaro.org> wrote:
> >
> > Use devm_of_platform_populate() to populate subs in the tree.
> >
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Other drivers typically call the populate function at the end of the
> probe function. In this case, however, it is invoked before the main
> resources are enabled. I assume this is because the CSIPHY device
> needs to be available early. Aside from that, it looks good to me.

This becomes fragile. The CSI PHY might be built as a module, which
might be loaded later.

> 
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> 
> > @@ -4964,6 +4965,8 @@ static int camss_probe(struct platform_device *pdev)
> >         if (!camss)
> >                 return -ENOMEM;
> >
> > +       devm_of_platform_populate(dev);
> > +
> >         camss->res = of_device_get_match_data(dev);
> >
> >         atomic_set(&camss->ref_count, 0);

And this looks suspicious. What if drivers for submodules are already
there and start probing once populated? Do they have a chance to access
this ref_count?

-- 
With best wishes
Dmitry
