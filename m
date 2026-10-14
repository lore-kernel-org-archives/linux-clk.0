Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7848453B603
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 15:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791990171; cv=none; b=NnDt95JIAdV9DWZ8pV+V4c3Ge16+Ue7bcfmxiu45cXwhGLY1VkqJUGr6GUsqsn/jBNVY6sgVQnuO1lZ+U/4WUt+c2ZRjTTo4WLGFpOzpkiWhiL6Z1RmFsGXnxLZF9w3RdNBsHWzXGPwE9spXOKJE4g1X+vSvvFcxa7HKgG9vYq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791990171; c=relaxed/simple;
	bh=D6DSOaHcvSq0t/JVKqdCTLF4wlLhu48+ANiIihPgiqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZgj4Mky+23rTeANHp7YrnMhXZ/hC3xQml9JHoPbGuxAiciEGqqOGHtE4e90oq/ID9PmarynDnHNuOXsVpLiwMXwBDQ0Pzs23PHYXiBpAT8Ymc5b4aKQmWfm6g/Q6yTeQm/S6nkuOtdbBcPQ5mGO3UpZFM3UEpu7X5EU5aHphhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nckwyOJb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BOy6VS1B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nckwyOJb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BOy6VS1B"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEafeN500299
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 15:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VLs9L3lY/vfTjFsZ1UhtwMXv
	kTr/rNAuLor1fwi1wLY=; b=nckwyOJbBmDHevt0K852xtIcZq5G1mXGcllTXYTb
	Cnq8fF516yDCg2QhzN1Tm9RP5trjnbR8SMDii6RzLOjqj47RIzIBBgygnjTA2Ls/
	xSf317dJIuaT0db/ktl7N0c/2gBz+D8LXAGkSKjTAyi/imVDiisK6L49gfZjegbO
	/z/Fux0vxeRJN7dU3gjghXRFFosrrZJFrLz3FmDeP8G6Zf3/PPmiEj4awPJSxr/N
	eJL9+8ZOYUP2Ly9iu56xGtKH5ybukDy52dBox6fS2OinwvnwVg5nQQCU9r1JS6Vz
	Z1xIXqXBHXqQNdE8a3YPN97145FjQQttzi72kWdCJ8fcnQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haagf0dxr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 15:02:49 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5df1badcee9so3319966e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 08:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791990124; x=1792594924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VLs9L3lY/vfTjFsZ1UhtwMXvkTr/rNAuLor1fwi1wLY=;
        b=BOy6VS1BHQb7n44vif00kP1Yqv6boew1tKvPH4Pe3kPWChrFMtgsNPx0lIIoETGTt1
         IpUUyeusQlTcPo4E41TCF1oqQAwZ74plVWyHcvKVhfxypyC/oRY32rq8HJg+td5SlC23
         WytYu/UYQF6BlY2eluS55KXRh6uadog+beIXyIOK3A6GYGh57jYYtKoeVWvLCC2FK1vR
         eLDhFqAqMSM3ccPHigXZO4imP297zsCgG7KS51nWmMUEyQCWCSMYVCK9MWj7En8J7b78
         l+4c+gyioAHcFky39baVBp8vr5qW0XtSsFmJajXeTRY1V80PVvyXQyzG7gz6HLkzn1Wg
         ivRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791990124; x=1792594924;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VLs9L3lY/vfTjFsZ1UhtwMXvkTr/rNAuLor1fwi1wLY=;
        b=oKAHB1FInx2Ac3jC2Kd1fWuJPxvg+LDAhzLn/Ctw61GoqeaMlUwI5RZ2bUZ3OgPQUz
         4sRYl6kVsRE0JAEgLk8i5WmMs0IOCwQOrb/uJOFzyDB7Bd6DHeJm78fH3A7jDlxTyGnc
         rIBXqbzpABcUmclDCFayuHTkQf2E1hQQk3LG7j3xaQwDlem3xbh4aCmZ6xmeIcKxhlYm
         8w6umQS3eDcZV6LT0ihxRqvDfbrb7RKV9XWRtclF4iqV7yyVCmB+Yr8Z3C5qhI5tKXpW
         CQc6wsK4QyMJWWvHTp+TwGGUbWgq6BOV29nj85uW9q7039yCb4KGWdkgHGNqPeeKKE+U
         sf6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxG8WHdFAxN91sLaZMGWFTj4hX0zmLXXs34Naus8iboGlG3l0CQ9Ro+slEhycJYBRzKy28P52eZYOo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIE1V5jrHm66Bt4qL7ayiW96VS2ATkKzlMseZVlpr5WXvk8YF7C
	Ie+zsUaHB5LHU630GdW5fgoa/ccz679t53jYWmnyLNuC2SIPj7XIj+nSxAHBFlYvvuo5sl+ZF6f
	Ig9pBqil0s+/PwtjcxB2LGaFsHXJioPnOb2A8RoQEt8k6mSQWpaLGsmwhK+wlpXE=
X-Gm-Gg: AYBFou1TFgxzSweWZWyg6gMqOhAzUDKJ/apWPWqHwYhXQpdGYlM1PG2Td6A2vKxx3hj
	W+yWRb6YFVucBQ5COpzFS8af8qJdZj4k5win0WACSjWucPFhH9gmONGJ5F25ihWs4mFc8mxIa8I
	PJ0XWK6jjeAcs8Fy+S/VGAdE63ax3bRnDNmFb0SqBw4M4Pz8N7UCuxX1jcsZdTabjYwBTHCO+w5
	gUyXBWrPO5NxDeRqmL4EgqgyimRohOMn8QUR6afmT0SvniDQl13/OQMRi65dOxfz1YVj7dzpNDL
	PsiOW88eOJDtVyVKLYg6NIChj0GqT77K05caJs2XjsdmL0500WZe1g1zMlVKxpYuwcf/ZjmqnWU
	e258d8M/hlBDusk9Lc94SgK46PVA5R8s8kVfVVoTgfcIRSt3DnLYQ+NjuLtMb1WAGrpIXevsXmj
	29e3loSzmIgGS/
X-Received: by 2002:a05:6122:30e7:b0:5e5:35a5:8b09 with SMTP id 71dfb90a1353d-5e91f4c2a8amr5417818e0c.17.1791990122703;
        Wed, 14 Oct 2026 08:02:02 -0700 (PDT)
X-Received: by 2002:a05:6122:30e7:b0:5e5:35a5:8b09 with SMTP id 71dfb90a1353d-5e91f4c2a8amr5417712e0c.17.1791990121807;
        Wed, 14 Oct 2026 08:02:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33da3ab7sm703310e87.83.2026.10.14.08.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:01:59 -0700 (PDT)
Date: Wed, 14 Oct 2026 18:01:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH DNM RFC 13/16] arm64: dts: qcom: sm8650: Describe clock
 controller power rails
Message-ID: <555cch3ceqlonpp5xgfrtxesppxolhuedabmw3twjjfspyoj6y@in4qkpalmuwr>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-13-3041b788e9f7@oss.qualcomm.com>
 <su6pmts36qj4hogxfthkrvjr2aod2r2u33onxifqanbarxk3tc@36qoces4rwor>
 <2ce49c83-b861-4a0d-8412-e8b3ff33bdd5@oss.qualcomm.com>
 <lyeiklz7kcjhotj43wir7xutru5wmjbrwfwauwbyzx5jcgpito@uyryg2sbmsf6>
 <924134e4-946d-40e0-8d93-2951aafda4f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <924134e4-946d-40e0-8d93-2951aafda4f9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1OSBTYWx0ZWRfXzrcfnc3/vRy6
 dnu1tXUZmF2Mw1bj7SgVNCzKJDxNynkCkPOwZGTMqzvMIvTdM+IbrIDT2CjrH7lxLXmaDqWFcqc
 aySEooId/mkfvrpZ9TfQA1hKiOBOeZf20FBagLjZVaCFfXpJRoF0ORuwtT50NG2ML/gtpPrf4qT
 tsbIp5d7AfcXcVqe3/O+KhHdzFTArQgERDYnM+2SkixyAkQ6HcvjKIzAYIHN+I/S0qU2Rx7GtVc
 DVU4mRTMSF8b0wX78/vwQjekxlLQrkYKdkcxIqU3OLCcP9n++BxS6ZNBf3Z6n7TNhvBgVh6fNfi
 tzR1bTJrrkOzuM4dFYa+yw7OHQtGL3Ku5WfT0RF5zc8ut4EWtajSHC1XGcYlZdLjW73hN/ltqws
 si9sqAItNYYsorF2lM6ApBSD+tVvuwGeYpjo/BRDcijHuB7o1QmRhnuZ38TqocNWyAfXoTENCni
 sLron/zV7XSmjfoFrpg==
X-Proofpoint-GUID: NMaihDmc7h2BgD99IK9yYXS-EP2Q7H03
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1OSBTYWx0ZWRfX5ICx7AxRTMCh
 FbOnZ4mIvJVczxodkbbY/2VNlCiTsdeg5LPpuS/lpQQx8TE2LjDfDh4X0NWcX5EW7X4LDQqe03j
 VICagMt8J5EOYgoZVeWk4pkdxa+hY1E=
X-Proofpoint-ORIG-GUID: NMaihDmc7h2BgD99IK9yYXS-EP2Q7H03
X-Authority-Analysis: v=2.4 cv=V/noQuni c=1 sm=1 tr=0 ts=6acf9999 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=FrZRtYz5i2LrMhXnUOwA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140059

On Wed, Oct 14, 2026 at 04:36:11PM +0200, Konrad Dybcio wrote:
> On 10/14/26 4:33 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 14, 2026 at 04:20:08PM +0200, Konrad Dybcio wrote:
> >> On 10/14/26 4:19 PM, Dmitry Baryshkov wrote:
> >>> On Wed, Oct 14, 2026 at 02:19:13PM +0200, Konrad Dybcio wrote:
> >>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>
> >>>> The SM8650 clock-controller nodes omit rails needed by their clocks and
> >>>> PLLs. Without those connections, the clock-owned DVFS implementation
> >>>> cannot attach its voters to all required domains and controller probe
> >>>> can fail before any clocks are registered.
> >>>>
> >>>> Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
> >>>> Assisted-by: LLM
> >>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>> ---
> >>>>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 16 +++++++++++-----
> >>>>  1 file changed, 11 insertions(+), 5 deletions(-)
> >>>>
> >>>> @@ -6049,8 +6055,8 @@ dispcc: clock-controller@af00000 {
> >>>>  				 <0>, /* dp3 */
> >>>>  				 <0>;
> >>>>  
> >>>> -			power-domains = <&rpmhpd RPMHPD_MMCX>;
> >>>> -			required-opps = <&rpmhpd_opp_low_svs>;
> >>>
> >>> I think this is neccessary (at least on some platforms) to keep MMCX out
> >>> of retention. Even if we can drop it here, I don't think we can drop it
> >>> for older platforms.
> >>
> >> MMCX exists precisely to let you turn it off, the clock patches
> >> retain a way to keep the clock on during the runtime-resume of
> >> the clock controller driver
> > 
> > Turning off MMCX is possible together with suspending the dispcc. If
> > dispcc is resumed, MMCX should be at least low_svs. On some platforms
> > it's handled by the cmd-db, where MMCX has a minimal value of low_svs.
> > On other platforms MMCX lists 'RET' as a possible value, however it's
> > not enough for dispcc (or other CCs) to work. In theory, *I think*, it's
> > exactly what 'GCC_DISP_AHB_CLK' might need to vote, but we don't
> > represent it.
> 
> Retention isn't a ""real"" state the OS should vote for, as the HW
> downstream of the rails generally needs some flavor of LOW_SVS to
> function, or at least I don't know of any such cases.
> 
> See also
> 
> 7178817f1904 ("pmdomain: qcom: rpmhpd: Skip retention by default")

Ack, I missed it. The price of doing OE instead of kernel for several
months :-D

-- 
With best wishes
Dmitry
