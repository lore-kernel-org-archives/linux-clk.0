Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2779C36605B
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 20:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773087162; cv=none; b=pkTX2XDi08Tazmvzxy0+f8LFPnnSEc7uqL0Nu8GHXmQvGfSf+MQrszJb88vIypC4+BAiuUdddksPyY2FQTCbhbNqmEJTWBcrnTU6rTI1NWFDFI5KyDlIca8nb4304YjMPYw2irNP1N/ZMAC4ORMBcYSFmB5uL10CuHYiLV4j9DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773087162; c=relaxed/simple;
	bh=UlBS8zDCFq3qzumo/lae5ujk9i0RFlrqy4DknCMxrsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDH+EhFohztQ8Eln1CyGIEfFZtDu3locqaS6qP5ciADpQPCbfEAyJ3SncTgn2KFtREARqMODzcERxXN2ON2aZriMYOFg4SsfBvdngqHrFg/IZvMhEv76I6Ep7qOUG86MPWuvebaIIdmJrygsS84I4GOY7xphuEsSnBJo6ixXeEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f1cbXDht; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Apn9ffxo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f1cbXDht";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Apn9ffxo"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBp8e1297740
	for <linux-clk@vger.kernel.org>; Mon, 9 Mar 2026 20:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WhibxgqJcJzy36Lrz5MTMsf9
	66TmVFjPQjvRvKYimYo=; b=f1cbXDhtiWvHpQ/14WfLH1FwotMpW54iIHuAOxpm
	9VDQ+GjnQk7sjxZTfKH4Zc/hgVz2uCJRFfSte57HraAJOynXGbw3zKMNBBfoyTv7
	FpATUiEq3hD1lSJ9+V9V8tH1y4noins/10tT7qm5F7azWwNzn540S/4TEnyLgLYh
	gLnyiysD9GDxm6dtrgmJnG8cTn9UfoA2qUf0WMQbQHX0GUqV/pguphhGxuCBk+Y+
	pPFvtnAP1s5vpI/qNE7mwg8EiG2wwb/2X5/mQOdOWcK0jITZKLvXxDmXp9WyGvA3
	+kj1A1JWiJhgrInHih6sNBJ1YGjwXqdfqvWIaAbS4meNAA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyv198vt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 20:12:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7f6ac239so1143944785a.2
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 13:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773087159; x=1773691959; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WhibxgqJcJzy36Lrz5MTMsf966TmVFjPQjvRvKYimYo=;
        b=Apn9ffxoBKWrwNfUTFFRzIB3D+MMd2co/jAkQrZAP7zhSy0qPQj6xRByFjs6I4ph6C
         kKHQn0hF1sSjN+K6BAngdI9oT1tD0IHxP/e0ArcZsA1Ji1kAJwRP8XkTUBVtfzq5FORY
         qqFQ1H4DLK9kM+qiA+7PDn5HHHC+aR8UesFm9PUYYwXchqJX2OL0HBU5FRPR46OZW7op
         t7GnEEL3AfqlMmvDfgOgYGj6LE48cNtPNwmiiTZiEOcSZ7xbRAF3S/eMk76acopPG/2J
         PqhJm+S9AjvqI1snSlzbCew5yZQ6QB5TGdt5HQyIhO7CrGbXY+UMfx1oTmfEYVl+MbtD
         WQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773087159; x=1773691959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WhibxgqJcJzy36Lrz5MTMsf966TmVFjPQjvRvKYimYo=;
        b=Ihi6NjhhJ8kDtiFJD4HUKwyfWA7IzZnb5qXxtzGt3fShfdXQRFURhmPGr8qkDZhTZ1
         ux5Pwq5tUrcWo+96uSGRFxTEc2lYFQMWKB5T9WWZ2dORjKIFU3+0lOJXmNdY6B0xu8v1
         U8q28ejSxwaaLtHpny56I0cCZzWWdHwRrptCkv+WYx8H/EAT8vtSmDH8idedTRS5bcMj
         0IVGD5UEptV/AytbQALwfc9nW5dnOlAkXo+bKTHlZUqBDhVUGQQZsoQweqyc2sHeAbSy
         9KMeFnfWAoIUBu/m3xCQo/Z9Hcd+j/rk1qpntROVcnUmOsD6Cb0wkhK5OoaK0LfuIEDo
         qlbA==
X-Forwarded-Encrypted: i=1; AJvYcCVSXSCkcNO1HX6y6xXjzEgjLU5D1dQkoWN/lWqmPxT2BT8RC39OgkqcHZvcCyf/Ob28p88LEVnJtfE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNu/FFuzr7ACphGfCM90F2AI1FeRMv+WK7Vz9t/Wf1tzWNbq3Y
	pd6vnJPaMenXmKn/3p6GS8CWH8dby9ohUthiEvv4hQNq7NjDCwTfZ29XhskpWhW4JBkoiThkOJ5
	DQTa2sJ1r6wZuItjh/VO+rNdCZYKpThAnj7SYNi8MB8t4aKXXtXL0B6JfgmwRzZg=
X-Gm-Gg: ATEYQzzygSIkDCY82xz9B3gLVJLDeBIFv/eBgvJaAGgNp1MMrGC5egvWXAPkVDU3itC
	Z+WTpNTcOlMqx/rHJZt2HZ2A0CJRcF3kyv+Nf8rCNOULzVEwPaOeKTPkCRDnqsA5X12JwpFoYPk
	dmVw6ITkZKavL0kn42T/8bpaJG2jqi59zkusEZl/gnXjd4CRxTJoSLFAjb7GrdIVIS4yDXogU6C
	L78bmh6GkyEJxJxT90OHFUaIvBbrwH+6t/Cw6Gcqh4Ni8HRMZ+Dh/x3c7/PgJlOPobA7APrStfe
	I8fGm/Eauhyuh9PSntBnHVA3uHl4WY6ZMgPkwJto6yLsSLLugfCs1qCM8s4+FhieJ6acZo1C6oR
	W8wgvwMl5LCSgdgFDKaPzFNxE/qDwSoGjstTw7G8qKPspum7l+3CHk5mT0g3qZSyrNSPRSBge38
	23UCkYOh45bCwnT/iavHffjQQUtMPfntuNFZs=
X-Received: by 2002:a05:620a:3714:b0:8c7:fdc:e871 with SMTP id af79cd13be357-8cd6d390203mr1601995785a.34.1773087159308;
        Mon, 09 Mar 2026 13:12:39 -0700 (PDT)
X-Received: by 2002:a05:620a:3714:b0:8c7:fdc:e871 with SMTP id af79cd13be357-8cd6d390203mr1601991985a.34.1773087158851;
        Mon, 09 Mar 2026 13:12:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08d62asm2243445e87.91.2026.03.09.13.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:12:36 -0700 (PDT)
Date: Mon, 9 Mar 2026 22:12:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] clk: qcom: camcc-sc8180x: Disable always-on clocks
 on probe failure
Message-ID: <3xct2a34yimgbqp4war6hkc5txnbmsys7mkfgpu4hmsop6nqts@pmb7zymm6wn7>
References: <20260309010214.224621-1-val@packett.cool>
 <20260309010653.4266-1-val@packett.cool>
 <20260309010653.4266-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309010653.4266-2-val@packett.cool>
X-Proofpoint-GUID: XihYtrQGeyUdn79YV3Bdtj6FBOQCorXe
X-Proofpoint-ORIG-GUID: XihYtrQGeyUdn79YV3Bdtj6FBOQCorXe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE4MCBTYWx0ZWRfX5OomHUq+ub90
 IBKzcjBdp+vUbLXjg6c2zB2bwPjFNEOSzvKdyoMIEOl3fuCffGUG+D9ROadW4YOCpIJzw6ToxyD
 BGk95Alr2kkJqE9H38lDrhVwjXG9jFG4bj0lE2tYzxnVTARMAgMRS/L4z4G75Q+Rzg3igl6Q/eu
 NlPWLHxtxKrM3NeWHrEg5DlB8ckc+lID7GRVUbosPLmbZ0Ya3Aki2K7YNR+9OAJW/DKYNTePVR6
 d33oPjaZ9UlfELq04p4njpIdcege42a2Sijs+t5+Zt7sw+WbS5krQUGhBRMv+GqprWE/0cHtvN4
 U6wVNTcNwtsG7l6DWbpYwE/Bk9z00p3O+gP5XKw0IKfNDEQTuirbeZSe/BPghtxNxdzCEpvNQCL
 o7V/+GmTHPmqR4PIWdnt7GrG8V/cmTtg5oIvEi/6H7swofxLAfROZdgG0VaDT9973DFfj2IkoAM
 f3j7l3J2ZZBdUlkvHTQ==
X-Authority-Analysis: v=2.4 cv=Cuays34D c=1 sm=1 tr=0 ts=69af29b8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=IplSaSJw_Jdne1jC1k4A:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090180

On Sun, Mar 08, 2026 at 10:06:04PM -0300, Val Packett wrote:
> Align runtime PM code with sc8280xp, fixing clocks being left always-on
> in case qcom_cc_really_probe fails.

Why? I think (some) of them might be left on by the bootloader.

> 
> Fixes: 691f3413baa4 ("clk: qcom: camcc-sc8180x: Add SC8180X camera clock controller driver")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/qcom/camcc-sc8180x.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)

Should this be folded into the common code instead?

-- 
With best wishes
Dmitry
