Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FF62FFDFC
	for <linux-clk@vger.kernel.org>; Sat, 23 May 2026 10:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779530705; cv=none; b=Fzut6J8KnaVDic+0obdJhRAf72luextOulkffIFjl7ttwabTKEYTjXzurBFMbjhKZlPI61YjRDEsHiCfxPCkVlqOoySjkwv+a9TYHSHfkSsZTdoC6x2JmeAj28+J4ikA5qzfnH9ztBn98nmFiD8LCFqxALSe5JhOcyCb/Xn4nmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779530705; c=relaxed/simple;
	bh=V2304hPhCLaEINeRbW3svJXgId+CqxWIXKfD2dxHamU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SjYx888a1TjheC9/YNvWBfcckYvXXPIwF4IAeoq5AocOnjsdE98Dph1UP8Xlzx8P/ygtUuutq9x6PsUGLnHAZ0joR5OCIvPzPl5jBK+9qgVXR4R5MkFom3wZX8UI2wOD62a8K/by4x5b+rUjIY/sqtSk2MjZdXagsw0q8CI/Zzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ggZSGHPV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IUOyR/jb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ggZSGHPV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IUOyR/jb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64N4m7de4024093
	for <linux-clk@vger.kernel.org>; Sat, 23 May 2026 10:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q6snCAeBxTChm0m7Qo2dMFyc
	2TEwUXTAwg/b0rMQwwE=; b=ggZSGHPVRBPDMztoPjqLNzgFvF0UUE4TDgrCJCN6
	s4iqBCwZ8+NwYm6OEL6YU65wSUlgiYVGvocB6Ivn+g8Ip5iR2cJI9gLYBLbwU+7z
	JxXUNB2k0ldcXczpyWBkTFZFhYfYJF13SzC847CgeBGc0lUkzORe1VPX0HNr7CGF
	f02P2PCAZBvJbkPIwBMZNeXR3ykm2WDzJLnEPg47kTCLQxOy6HjxgVMM+Zc+kyrJ
	ShXLu7h5qYiDq5Ark+UTPh56rfsazMtqRAGn1hwBK2GZD0ccs23utthRRPfPBDFJ
	C0YLnczWsoWVeKv3yJU5Kx27NXgUjxu73T0uaUfea7wDAg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb5h9ggsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 23 May 2026 10:05:03 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95fd0a49df1so11002851241.0
        for <linux-clk@vger.kernel.org>; Sat, 23 May 2026 03:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779530703; x=1780135503; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6snCAeBxTChm0m7Qo2dMFyc2TEwUXTAwg/b0rMQwwE=;
        b=IUOyR/jbOVBzjYGeGbtbd5eL3nBXxei5ER6xvpFJdq20ZyW7UIOfuSzuPUHE0a3EE3
         2Gl0kfA+hDqG07RQ29tgar5T+6ahEILXOKmDMNXvXAX5jcBgAm+hbAE/TiT4pf/8SCCX
         ta22GQ1Iw5ecRMf+paX7m++2AAHc8Urzv2Xm1V8NAFYoxevbJYbgvvNaOeprd9sIbY+x
         13YgVPx64FZ8utOjWUz96jLSlgi/SenpT/Hg6SH91hvsSsK+DEznrWxgHvxOWb3PS+Av
         GeTjs5aDx4dHNyOxjbOp+u/eYJeYxgl5mzSQcrsUjsS4IQQ8QvAw38X7fOLhWMUMR9Hd
         U4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779530703; x=1780135503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q6snCAeBxTChm0m7Qo2dMFyc2TEwUXTAwg/b0rMQwwE=;
        b=dh7ah7HE4A6cxp8ip/EfZmXR790dqXsT7EDnFlIM0D2Gfb2INqmJAsyUbaH3QtD15D
         t2LflMrT1Na/nVASAv8NfPXCuQf3WVsZb/0818/yBDbQcJlZvnU31uM3vBF5jwRiXlpy
         Sr0+DP6ScCwX0uma0batj/q0uLVsyNTV9C1SolbllRwgQSXAak2TKkjQLOtLGTae5V2X
         b2eVE/J8lwdGo37eW9rMF93iGTbg/K08Yw/yAPAWse+wwYZ87cTH5EV/QnU48KrZo+MC
         EmgQgtPXBjuh3ZTUTXxD4gmFroRmupnwuEZr9uQ9Gpo1JSKXggFTeH8+RpnkrdyrghHS
         Gt8w==
X-Forwarded-Encrypted: i=1; AFNElJ9Ya1sd1fusg//zK3FiHmbnDQlEJZ9bmIPxncZWX1KsHznn37ixEW80ixCW0evOAt5CeFzcZ/kprdU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjxzWiCL518QPMKJYiEtoRf+/x90MI9/1azXT7plsLlnu+8yG/
	UwMESNCCl6M3Jd772bhWlyuVch3PvCaa+eZKgUuyqT0+4MWtnBeJ2FJi/djkPDolqqhz3DntaHe
	ZwraDKI4WmZsE/W66vUdM85kZGwISYXpV9DQEg/EXTgnHqJhgw40I3a3kD73jqQU=
X-Gm-Gg: Acq92OHVVFNhvXHekUBfwociAyd5VU2pBweWHIFqiaqgh2UN6pzH5OUKSynGFXI5n2P
	Pxd+tBZx0p6AK8/6pJDV/1mLusEQ9G0qPTbOlOvbkJgdzMXPrHvgOTr4OsooMArG0YjJkmLVgCS
	Gm1LyyE1GL1UqiH7nj4j5jnsm6VhSe6scczcMOHtBIoAg1nCQvNEu+znkITYOB/HL9azxeBMZbQ
	L3Qnj5U+MQ8UPSiDD88C2zJrM6b2QuyaFMa2Tl1Ie7Ql3hHVpor+4aJ99tRWYcvRssGFKr9NZOw
	pLbDvmUzBlAdYdiHCh90NLork0r4mfpGEkdU4sgzezQ6AIz2N8yOOio6kZPNloWLj1VoBzkuuNC
	+4Gbbuu1U5yVPZbPB6DYEynxsghJmAXfTRAk2E4+HHtXC+oqKe+n5/t9sW9GSNTDYagzJcNiS0S
	so1s8dd7tx5iLhz90gf5rWiomHeKOrS2WOJME=
X-Received: by 2002:a05:6102:4bc5:b0:631:ec2d:12b2 with SMTP id ada2fe7eead31-67c7cfda10cmr3919357137.1.1779530702844;
        Sat, 23 May 2026 03:05:02 -0700 (PDT)
X-Received: by 2002:a05:6102:4bc5:b0:631:ec2d:12b2 with SMTP id ada2fe7eead31-67c7cfda10cmr3919338137.1.1779530702402;
        Sat, 23 May 2026 03:05:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cbabd1sm1024783e87.34.2026.05.23.03.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 03:05:01 -0700 (PDT)
Date: Sat, 23 May 2026 13:04:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: Add support for Display Clock Controller
 on Shikra
Message-ID: <xuynixonurezmfvmqqshobbowknjjsgin3qx3z2omsk2ffzsry@q5toxb47ahz3>
References: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
 <20260513-shikra-dispcc-gpucc-v1-3-5fd673146ab2@oss.qualcomm.com>
 <n4wgnno2td3xmdsgwadvdtvr4ncitzio3ufufg5bp7wnga4ouw@mj76764e3uus>
 <dt5j7khzvgoj5qdrnfoi6ssye23jve5gjta5qx2ubuvufjzr2w@puacv5jgosmb>
 <1cf064d0-14b9-489f-964f-614aeed4fcbd@oss.qualcomm.com>
 <qg2n6pwjcoz7262eylept4mec2l74h2owfbhjykfxap6qwgzuq@oawiwgok4hhi>
 <1c0bb8ff-eaca-4779-9b2f-4d564abd8670@oss.qualcomm.com>
 <dv5rw3gkmy7evlv3bm5ryewy6ppojxgcklamqmc3x567isomtx@3oonu5gtzwq6>
 <143e095c-471b-4cd7-9395-1fa06fa50625@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <143e095c-471b-4cd7-9395-1fa06fa50625@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: sBECV6znF_kZXqG99bznknIvWW1T7jzO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIzMDEwMCBTYWx0ZWRfX9fh08o7ZJwym
 XG0SPcIaV9dOulz2o+i4JsYALuoDWDppSgMGJMWgE/3x2edIaw0TbeJQPCZ07nZ/MkJXUs6vp4R
 QG2Xy7YqCI3Gif7OQkisVnQlkU43R7YNx8psIXz0ryubOeqw0Q/bjDzVXNJwmwYt1dO3jnPsGdN
 PpV2VP2L9JxSoJYfel02fZtaDoMAjK091aiuTyWdVobxq7LvyKSD0OHF63iaRAC3rTT2O3kmtXJ
 UbHxXM3q7hWg07XZVzu0jXgKrTWe82kMYbWEgykiLqj9833oEoDFjZQJRDmkVPgMMz410aPiwkq
 aYDytzgkjoSujAjeohSgC/wdCUW8/Wi9m5CX9jFSUc/pFwY4qrqzBhfokRK0kqgmonI6roA5UI7
 YjL7kPmJNtRV5D8UHnp9sADD7lywfkeXvMY/+HKG6TEF+asxZSEvpSRAqxr2bZ5laVyMJIZyZ6b
 K1eqil3f0+D0cDKAmvg==
X-Authority-Analysis: v=2.4 cv=H7jrBeYi c=1 sm=1 tr=0 ts=6a117bcf cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=xc8VvEWKhJEnYHvCR70A:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: sBECV6znF_kZXqG99bznknIvWW1T7jzO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-23_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605230100

On Fri, May 22, 2026 at 02:39:01PM +0530, Imran Shaik wrote:
> 
> 
> On 20-05-2026 09:59 pm, Dmitry Baryshkov wrote:
> > On Tue, May 19, 2026 at 09:34:09AM +0530, Imran Shaik wrote:
> > > 
> > > 
> > > On 13-05-2026 08:38 pm, Dmitry Baryshkov wrote:
> > > > On Wed, May 13, 2026 at 04:51:03PM +0200, Konrad Dybcio wrote:
> > > > > On 5/13/26 4:06 PM, Dmitry Baryshkov wrote:
> > > > > > On Wed, May 13, 2026 at 05:01:16PM +0300, Dmitry Baryshkov wrote:
> > > > > > > On Wed, May 13, 2026 at 07:10:38PM +0530, Imran Shaik wrote:
> > > > > > > > Add a driver for the Display clock controller on Qualcomm Shikra SoC.
> > > > > > > > 
> > > > > > > > Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> > > > > > > > ---
> > > > > > > >    drivers/clk/qcom/Kconfig         |  10 +
> > > > > > > >    drivers/clk/qcom/Makefile        |   1 +
> > > > > > > >    drivers/clk/qcom/dispcc-shikra.c | 565 +++++++++++++++++++++++++++++++++++++++
> > > > > > > >    3 files changed, 576 insertions(+)
> > > > > > > > 
> > > > > > > 
> > > > > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > > > 
> > > > > > After comparing the files...
> > > > > > 
> > > > > > Can we use dispcc-qcm2290.c instead? It uses clock-names instead of
> > > > > > clock-indices, but I think it should be fine to use clock-names as a
> > > > > > one-off.
> > > > > 
> > > > > Or we can convert it to use indices, since those are stable for agatti
> > > > > too - the names would remain in the binding, just unused by the driver
> > > > 
> > > > Either is fine for me.
> > > > 
> > > 
> > > Hi,
> > > 
> > > In Agatti, apart from the clock-names difference, I see that the AHB/XO
> > > clocks are not handled as always-on via the probe and instead rely on pm_clk
> > 
> > There is no pm_clk handling in Agatti driver.
> > 
> > > style handling, whereas Shikra follows the newer pattern by marking required
> > > CBCRs as critical during probe. I think that attempting to modify this
> > > approach into Agatti may introduce unnecessary complexity.
> > 
> > Well, you can start by explaining what caused the difference and the
> > result of those differences.
> > 
> > > 
> > > And the Agatti DISPCC doesn't have the DT_DSI1 bindings exposed, and
> > > updating this might break the ABI with respect to bindings, and DT.
> > 
> > You can add Shikra-specific bindings. See how it's handled for other
> > dispcc drivers.
> > 
> > > Given these and considering that Agatti is already stable, keeping the
> > > Shikra as separate GPUCC/DISPCC drivers is better to avoid the risk of
> > > regressions and complexity.
> > 
> > I think you've provided arguments for merging two drivers. It would
> > allow us to modernize Agatti driver and also to make sure that both
> > platforms use the well-tested code pattern.
> > 
> 
> Sure Dmitry, but we would like to proceed with Shikra as-is now since it
> already follows the latest upstream conventions, and will handle Agatti
> modernization as a follow-up series to align and reuse Shikra drivers.

Having two drivers for the (almost) same hw is a bad idea. Please either
refresh Agatti driver to follow the conventions and then add Shikra
support or add Shikra into the existing driver and then update it to
follow the standards. "we would like to proceed" is not a technical
argument, it's you trying to override the review for the managerial
reasons, which don't apply upstream.

-- 
With best wishes
Dmitry
