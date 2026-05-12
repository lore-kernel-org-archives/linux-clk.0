Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BED5357CEB
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 18:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778611760; cv=none; b=MCi7TUyZjSCCH7enSd9/4B80QZSzQ/lxwVoklJCkOdDtDHUnX88dPamSRYvywW0H/eMvvmQl4FThH3BsGPV35jgc0LchN4M5MnjHMB22ESF55nCcq1L2Bo2lIouTs/IOd1T+UKD7CWimMMoQ9cz3XJz2XhpTKyMdYAv5ZEVD5mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778611760; c=relaxed/simple;
	bh=poC3rwVOHwYvOMVMOOACw8sBuBFjKQlRM77g9zwv0X0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZY/qtzKEfpLXcfmR7sEmNOC2ajythgZ5v0fqS7td+dXGvmycdmGbhDN9Fq6Dmgudrt02cIMtMW+74w0p9dqPNKgYMr4+zIjYpid/ovFfZ1xDOoNikuuGUYBa3dZfu2Z2r1eYl6WwY976JmcfBn8c4DdqeGyYp5hEJnHbVxkGlp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TBh/D+TV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fMghJ9JH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TBh/D+TV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fMghJ9JH"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CDgG5V680094
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 18:49:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xCGIbxNFoFGNHYaSu9RAzibe
	V5IaAoj/NmK3urAHHuU=; b=TBh/D+TVU3LmBPHJlnd6bTzO1Wiq1MDHQ9uYkwON
	Y6bS+LHIwUVj5oKC1DyXh8pbDB0IPuaVIeiblYifEVqD1HQPQ/fZvho4Wdrd72ot
	KvZAELchdulT5Sw5jMErLrj/c2Y/9aw6E9oe8BVuZurq9mrK+vYJ96r6qSL1IYMx
	nhiBGLM+uQDvyrR6HOR6xx3kOAzl3D49y+f9LFk9PP1t5PUKom5j2G8ztUeK1bH8
	fX9q2O0TNmejw9jqy95aF0zuhLUH+YB55v/0WrOxMVsupiUyIS8sYxxN0i+AIrTz
	M/8Nx2Zw6QIR0lpS2B/7uPfTpKlQC0nvAima4kC/bvYFFA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e45avh9ey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 18:49:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50f13da9684so46027581cf.3
        for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 11:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778611757; x=1779216557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xCGIbxNFoFGNHYaSu9RAzibeV5IaAoj/NmK3urAHHuU=;
        b=fMghJ9JH5+jl8Phko3dTGYBKrlYa2LNeTMlecbVDRF0ZqtTW3i/2dQy5azN9qqrrNH
         u3J1p8gNE693hzzs+S9FfDLGXzchWS8mGMm1aeoeyHE+gN8Wun8hu0BrGP6B4J/hW6iB
         eHkKi+1onKTbQ5/Opsgag9Q/lRycPRrc9pIzwXW8nmxv930abcupAuFr7Jr8Amxre16r
         cDLj6pPoguNIgYwACwd8/Je/EXGS3hLcJoP7sfpbHrnYNLIIh/2iMuUg0h/MFglfcrBj
         DCZgy7a7cqV8S+1+wD4BCKf+LX+1A5B+38642BrUQ/tJ6UzJ10qVo2wNJxMEYfk7I9/C
         151g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778611757; x=1779216557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xCGIbxNFoFGNHYaSu9RAzibeV5IaAoj/NmK3urAHHuU=;
        b=agkalX4rSTX4v5h/AQpC55M1AjBnA44edoLSQ4GerfZM4lBh3Y9F7cLIUzgBwmxByt
         QYy5RT5s5ngXX+D3X+XGEjlQd8VhDKOssaRmSTJlYOR3xqOD2f0ORxU3L1sO4WGoOW5A
         CyIJ7FKVFwxCDTIlvs7NfwmYbpXswhpKFeAZCGUogiE1ew/W9p+cw6ffZ73wmvPgkfA2
         R9OjZ7dW3AISsa4isHGWMbNyuiACaQy8RSIGIA8GHivRw3PzEsC9TgZZpopakced9RDO
         QNTcm/prlDguOW52NqwQcyi4HDuL8vvHw42w170tqm73q1uX3NmSp9PT1UMBy3DHxBAx
         yuNA==
X-Forwarded-Encrypted: i=1; AFNElJ96MfjTYT6KFfpwH9hF77huMr7TzD8PsfTUCZaPEP2ChOvrtD5kovicOtIFjHN24oeL6As50Ib8YMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxwbKHeMldL56jmODwerpiyIS83MURGP5OdUsI0ngOioTDkMSk
	yyullf+Ft0hvKkOZ4KmjWHa9Q2PB6JgeIAM4UJLfgY101S+5pRkXA+hdPp41rXvJ5tPV6X4wGLH
	meD9Eiizm0IKOSUFXrESoXSfrFMZShMHJdkfz6tD26VSNsHlPf0AAVyKTDKszvmk=
X-Gm-Gg: Acq92OHs5RfN8t+TIRlgUouZqtyh17krsY7wy7njFU1rrsfxzvLmuzX1EMon42Z4tqp
	5RyZGoRr63N4++1cikqukruEfBCMhx2JtpcTMxsFbkvoVxUGr0HmbubQr7KEBhP+FFB4nPt6O29
	Lodwo5D2mxMN9IYrjFD60eZCTTbl9rLVd9k3+7xFOYgh3ZcQnr35A79wCfasToz+E7+y55MJEif
	9m7rWx9NBACHrMLOvm/Ha9hHLFedTNAqVtpH2150d1NVhULRlx2KSw4QNz2LamEZ0eFatY5PfzP
	lpCu38gG2kBnBqr718bZXKZGSCdt7kU51PMz2eM62+KwokW6savhEX5WPl9nTL8UI6ROX5h2R7Z
	+oZ49YsiBI1/14NLKaodC/tQPFGjbzgOEdR9+MwUlxqDftPKplf/zjfWbMFw/jXadzTL4UmKHAQ
	jwJfPlMTmny0Uxk66NAvEVswE41bDZS3aDC9E=
X-Received: by 2002:a05:622a:1189:b0:50e:5a33:672c with SMTP id d75a77b69052e-51461c158ddmr436792361cf.17.1778611756989;
        Tue, 12 May 2026 11:49:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1189:b0:50e:5a33:672c with SMTP id d75a77b69052e-51461c158ddmr436791771cf.17.1778611756357;
        Tue, 12 May 2026 11:49:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956642dsm3428293e87.71.2026.05.12.11.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 11:49:15 -0700 (PDT)
Date: Tue, 12 May 2026 21:49:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: glymur: Add camera clock
 controller support
Message-ID: <q6hxnbg4b3crzo6g4h7bg25aiinntw6b5esajubpxuze5yev6c@jdr7tk5knu4j>
References: <20260512-glymur_camcc-v3-0-a7196fee2779@oss.qualcomm.com>
 <20260512-glymur_camcc-v3-3-a7196fee2779@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-glymur_camcc-v3-3-a7196fee2779@oss.qualcomm.com>
X-Proofpoint-GUID: O6yzx50QOQD_9ITwhq8RI6OSMAYt1eov
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE5NCBTYWx0ZWRfX3jGyPNZCwZjo
 gMdTWm7pYjq+/omx9CtZ5saBlApUHkSSI9234POsfEQGtIWkou68Yb/MAEDBMu5jNw1DZTrprCw
 0NivmK9SG1ilPxC/trJRPaAiCR8WS8HOd1tAVfj8XTFtNzhrUAULcQiiZYWmk1gZwqjzy46Si06
 TH1i/T98TNly9Z8YKzCexTS2XSiOm4pEMiQN5NWYcn0OepemU/Kqo2XAg5ivjRuI3HTadP3Iq7a
 1qsqNKqS7s/A0pxXjQM+yz9DOZ9/Siykrdqyg51wh/4yAiT37L72eXklSceJyjI0XKXlhESwrMf
 Fbsa4YBAK+Z1Gzd4pKfvnChkfmXubTLt6DAdrHRVdOkNncU+cK3g4mXPRSCr8aSUs6/6MWBhVqc
 TlfZ7s30wVGKAMnAJ1SiZ63HTWnSI49eJjOVXigaRQrmIzMtO6W/N5MjWS5yAI6oYPWr2nVPSGC
 GhoEGqNTj00Yiy6SoMg==
X-Authority-Analysis: v=2.4 cv=bOwm5v+Z c=1 sm=1 tr=0 ts=6a03762d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=1xNs490kL5DDSzzqZ6IA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: O6yzx50QOQD_9ITwhq8RI6OSMAYt1eov
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120194

On Tue, May 12, 2026 at 06:35:28PM +0530, Jagadeesh Kona wrote:
> Add support for camera clock controller for camera clients to
> be able to request for camera clocks on Glymur SoC's.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
