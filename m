Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E547B428495
	for <linux-clk@vger.kernel.org>; Wed,  4 Feb 2026 19:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770234134; cv=none; b=sWUhXS+E7Int47+l+aV7Rlr3BGQ7BBHoT9orkIsd3Iqhl9448H/B/moAvpUW9ZCExHIpaAA8E30Ty+u/kx4jH8rnRiEyM7L09kDeVquky3YfOsuVwdFc7/nOADHF5S/0RBzvddLjLl1FwwlVWYnY+mmbYZkVuSNOEXdbW55g8tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770234134; c=relaxed/simple;
	bh=K2uFDuUKGmXVbCeC1snrDX1rYEsvUw88AUuCxGr5Fpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SRm+EGDK970Wz4cmJe210GP+KVgzCMvocNHqw8NqgblBBzdgEzr7g/GuTRtXiiGNq96V/6Ja7ANp4lv7+sFO37WYCbZSA9gsHLURFqHDqfW6HQFLOjiew52sVcdjwP3J+MaGx6WbNnPVgXWzUqgzF218OffhZD3TQZT/sK/5K88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KD8YXFUB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L7K1I/HI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KD8YXFUB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L7K1I/HI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614E4Uum945694
	for <linux-clk@vger.kernel.org>; Wed, 4 Feb 2026 19:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lZnMLbOsj1Lb1eWQdiDib+VK
	dN9JrzI2okmR+GB2mLk=; b=KD8YXFUBvN0+PZS8yQtK+E4YWA7409mSs6x45HXw
	9aHws4otwUC1+1X4nVJJKacVkD0lCvYRLZ3Z5AQjZyWj/KWCEdtitTLxfltZ3F3F
	s1V3GKaQ+UkTzVgsGsCaSmVZ8E39DqTqfSioFvn4ZzB8JMdrgjnKcGhPQ9Sy6CBM
	sDgiWdDcDaPD1xZaFfbbdzSkneB2OSh6QZyejuUJUToCQ02C3hBYUIz/YJk9RP63
	Vr6rzH0XeH9S6MNMFR0rRSblHTobFipNbAbw0CbJDXsZBZv9Yutjm9NkBR1UXV41
	Q99WYU3Ktoxv2sc3gYAjCnXqd/8SHy2Co8N1l8IKkoK7yw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c47ja169h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Feb 2026 19:42:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a2f8e7d8dso2672546d6.1
        for <linux-clk@vger.kernel.org>; Wed, 04 Feb 2026 11:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770234132; x=1770838932; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lZnMLbOsj1Lb1eWQdiDib+VKdN9JrzI2okmR+GB2mLk=;
        b=L7K1I/HI4qPJSIHVBVxRaqBSF/rX4d+iFfIR86GniDLoWR0od4fCGy4sZEzIVXHGYk
         FtT6fO+asNDoN2QCRZzBon5Ig2LluTCap0RcQBJSx6tzAP23i/Fgd8ZcwiB7sjx2XCjE
         zadCND7WCtdHk7HT7L02WREYN0XzwM/3sfqe9ywbCAJmX8mRSf6pPgaTeydx66Kmkbvf
         pLhp0y6eq2hiq3lzClMArWWeEFkyG4+XqzmI9aQLwGWYOCksbA2aTOxL9ufqYnpV9j2A
         ZOTTJz/MVPpR/OjYWoY9EMF/2DpVaELVwLI1wv517xgxJUCliN3cAfInkDK9tZbmDAuU
         uTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770234132; x=1770838932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lZnMLbOsj1Lb1eWQdiDib+VKdN9JrzI2okmR+GB2mLk=;
        b=lhLWzQKDUDTH47TE0EImQWUruQUCEulPzOgVk0TovMlATjk/P35nh6Vk2eE4aJ8/Ty
         esgm/OGV6j3L69+FyhHvrtQB2mf0b87FaR+r11SDG2+NC+DZBiED5N5ujSlxG0rwLf6A
         ze2J1J0bZTDG3vyIbolt5ivtKZSLl/spStH3QXLTb9Mg61L+W4H/Ht3bJjWUDMpbSNa6
         0+OS+nv11tuFPAJOQBImL6elF/M1V4bvomgVeIcpe8/5u/qMNfKF/y9Zk/V1MoYPmisp
         AvMQtk/fJtDo9V2CWN6Y57wi/N+eWleTF5+Fac1gg3yKl4Ke6jCWyszfX3o/YJc88Z4W
         06nA==
X-Forwarded-Encrypted: i=1; AJvYcCUOsXgZbVkxwbps78JSrXGLZMvuDCKSJN6T0kDxLlL7trGxCr5C44kzqmovMdW8pXhh/aaZ8gpW29Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJbIGaM48Uej5NZ17yxsnaaH/ceXuYV2Mvrih90LNxNgHLyQVb
	aYqIvp74NxjAMhlSm0PSiAqKtRv1k/fN7ZvPYdLCWz9903fH1WlbGsNpqFbkSeA0FCSb0XgpBX6
	j7MlCQc2nhU1SOQHQNd4Ej1q0k+b9v7+vC02BTo1mqCigZMWjGIe44av7A60eRM0=
X-Gm-Gg: AZuq6aLcj6P4Qj/fy6SrVLfT2jpYZQu4KMq/bbYA1QvfzUipOZRKLcIEVrBO1KQ7zGd
	QKRsFGQWk+BH8IsEpn3HjAIq286cq6fWb3oXLR5h0eNZHfCrjbXjJJv6rA4k9QGjJ9ufOMD+bsl
	iRp6HNy7Goof7adzVKM1XkLDDoI+PDb1LX7jKii7+5pDmN7HXWhtzym3LNuUXwYw3wjBWMsreW8
	qiu/80LuK7dEZ6SQgVYptyhNcJOHrHsCIQTeeOciFb6Yry1un1elZDx8zCko4UB+FzU2aHmjn41
	JQjKqcV/vY6cvWk/drL+YV799lllM8eFp21HDQZS74n7JNrceBSYrWQTPWgk1LY1xnK/wqTCLi3
	fNGL9DX3wOJH2WrVkLtadPNTkHdkeYph3K8DkQrg4d5UgAvG8QOKpSRVS5eV6EjOsSmsKuqTg3H
	003vqkrCMzfL/S202HFwMsnK0=
X-Received: by 2002:a05:620a:4804:b0:8b2:f371:5601 with SMTP id af79cd13be357-8ca2f9c4d68mr522969385a.50.1770234132279;
        Wed, 04 Feb 2026 11:42:12 -0800 (PST)
X-Received: by 2002:a05:620a:4804:b0:8b2:f371:5601 with SMTP id af79cd13be357-8ca2f9c4d68mr522966485a.50.1770234131815;
        Wed, 04 Feb 2026 11:42:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e387f887csm866861e87.33.2026.02.04.11.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 11:42:09 -0800 (PST)
Date: Wed, 4 Feb 2026 21:42:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/8] clk: qcom: videocc-x1p42100: Add support for video
 clock controller
Message-ID: <vdx2ha3q4mkfhdfszgnqwa6rfkendlwgjlyn3te2h4l6jfkgmy@km7pq7faulub>
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-3-b23de57df5ba@oss.qualcomm.com>
 <aki2cw65fdl2toctcquprkzpltz4tejsyf2sudlfqy5hsluvx3@ayi7wqaa2csq>
 <97535aa1-6eb2-44b2-b04b-e7608d630fcc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97535aa1-6eb2-44b2-b04b-e7608d630fcc@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: N1e5llQx9AFHQkKIksm8Yml7XpfCtVnt
X-Proofpoint-GUID: N1e5llQx9AFHQkKIksm8Yml7XpfCtVnt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDE1MCBTYWx0ZWRfX6oT8/qlziEYW
 aSBfwUWiK/054LO35nmSGltn2slzLrPAq0XikV43mTx/fbIjc7SJH+ftgTQyGl+9yS8HBYQe9Am
 MghdxGGNl5q1SvaPGjM2ejpLMRCQscUGW0bHJHxuDYMEsnvgCDtB8MeJf2L1V2nleI9MBOP5Yph
 7f2hkCnzATZGb8mkAMW/hdAk76f4IrlcLkAr4gWG8NZEoRINYD8MUEcpEf7K9uAxyVkn6BGYAbu
 R/bv1LxTLIgI489YefzAB6CbfrxiE0xF8EsVrqQhULaJTQP2mAeOrKpZeuE5nMvbnpu+bTOh29w
 4SxPupsytiPjsHfWo1CafszlBhAW6KpD8GDiQDhK0Xevbcj78Jvi9achF0kcnnp3T3zrM6MrJ8o
 zXtWqZA+MmB7SMJ/hwJqCrYupDIXsgLyi63T+ChcBQPcBKmLLeLs6IWmxxKQj1YJpi0NNvA5Qc5
 ul1yMPfc1ZVbnlSrPLQ==
X-Authority-Analysis: v=2.4 cv=a8E9NESF c=1 sm=1 tr=0 ts=6983a114 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=wRy90H0ZoyRQatx6-qsA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040150

On Wed, Feb 04, 2026 at 11:16:34PM +0530, Jagadeesh Kona wrote:
> 
> 
> On 1/29/2026 6:07 AM, Dmitry Baryshkov wrote:
> > On Wed, Jan 28, 2026 at 12:56:34AM +0530, Jagadeesh Kona wrote:
> >> Add support for the video clock controller for video clients to be
> >> able to request for videocc clocks on X1P42100 platform.
> >>
> >> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> >> ---
> >>  drivers/clk/qcom/Kconfig            |  10 +
> >>  drivers/clk/qcom/Makefile           |   1 +
> >>  drivers/clk/qcom/videocc-x1p42100.c | 585 ++++++++++++++++++++++++++++++++++++
> >>  3 files changed, 596 insertions(+)
> > 
> > The videocc driver looks almost like videocc-sm8550.c. Would it be
> > easier to merge them into a single file?
> > 
> 
> There is significant delta, the BSE clocks are newly added and few cdiv clocks
> are removed. Along with that the frequency tables of most RCG's are also changed,
> accordingly initial PLL configurations also need to be updated, hence added this
> as a separate driver.

Please mention it in the commit message.

-- 
With best wishes
Dmitry
