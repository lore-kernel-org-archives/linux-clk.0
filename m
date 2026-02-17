Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF95A33557B
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 11:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771329152; cv=none; b=JlRVflrJFnqIdChEFip41pqeGPDrYDaanYq0Ykgd5X5HcsVv8CXWJgKhGwzUamw+m2ryYJEAPlgO0BBDbeV5KgAJn8muN6P/SDTlTK8ftZXyE0Oc9gffDu++SX7gWdcRdB4ut8g2vELiVihU3aAArBfa/TK35THyg1JudKD16nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771329152; c=relaxed/simple;
	bh=dAnsx0xJtEXMX1K0lbG5+T8XtzHHN4M4bEV/iMzg3/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ABn//d7BlUeehrWWNS8s412giZbLiBMqimP2QZhSss7Y+QhaG0e9XGA/vjMa0HUwaVa+iYznHDY86+W9Meptef1tyhJ8iLxTL/ElZIK8vvbqxzXO6JA5i2RHxJOaOUOYCm5led9LBtkkf+V+Jj6JzFmRh3g0t9S4BumhOxi7xW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XxwSyCwS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YkPAD5AW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XxwSyCwS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YkPAD5AW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HBCvbU006270
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 11:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N8IDiGrvccwFedf96OqEPLL7
	3MTWDtHz1uUgTvkRpt0=; b=XxwSyCwSVkYg9ZYy3G444Kvs3fLIwD2Apwzfr1TS
	l40/gOPfCCvKAFNbwLBJEDSYI4KuworD2tT4AvwDVijktiTyFPxQ2uKZLcxVAWpi
	U2Ls9dwaqJoBIC69vDJGE3TgfgiPyB/kCFcu/oOLEZUIUSOMFDPlb7rArryh5ntw
	RBH42y0AZADFyTleq0GtDIg5ayvnZLTs0Jkesn0+zIHmMxubKfj5/CP3aMxFRepg
	R9tzGWxfuHaE+NIcT7bVBUR7PbMMcaHgbhly+1pDBfPKUeemXooQisaWOfqYjFzx
	vR/PNipT2zssg8DQHAcg16DkMMfBXoo7ItFKGJCiRKkJFA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc5khac9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 11:52:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c7166a4643so2614004885a.0
        for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 03:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771329149; x=1771933949; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N8IDiGrvccwFedf96OqEPLL73MTWDtHz1uUgTvkRpt0=;
        b=YkPAD5AWX4OSjtoPrX/kvKKpH+JF6JGHQ+uU7oGtZFEDshGnlnUXzDuOp5NbI22JBI
         Vs0E/0iPB8Id2BIWGq/0r/e4Ui2+n6vDYGlyqw4MHFEjdzNhql2My3pSqritqM8iHV6t
         7+One3SWD1ntOL8rlKUl/cj5LKyND8t8KQnCciWAsO1Y0aOPHtFuvMbCRRK0nKYNR9zc
         xcll6/SxvyKRK4GMrfzGCKqOrlPXC0111FnErc/WRcmlfzD4z4/b11+BF49Q+P5GgbUw
         KerXwiG68gjIlabBiRzg0XxAo0IfIraUvFt0n2HqmqYbp+J1nOhYjW+VxQ3GT/n7wJF2
         o6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771329149; x=1771933949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8IDiGrvccwFedf96OqEPLL73MTWDtHz1uUgTvkRpt0=;
        b=meEAO9yJT+okly2VIpvUgPjZnWSCJMK4+bRHBCyyj89yfCJnsMJ8WDlcEVGp9yM365
         6Ogyp4lEOCZTQSnqNldu777YqgOywi/Y7ndAgSgtht42EWKJ9tEGjMnmCLK9xuCeefxy
         wdQt8YwBtnauGU5NHmn9FdLuIWuHQ3xCx7OPodQm+Rx8L2IoA1dw3BGCofyeZXCLicBc
         eudA1mxULz5Mv+6+IzKaYOQ/N5+MCGE123kQS5XNnepNeBvjoAjPGZkpnh/0k+XwoaHe
         t1NAZNdwgMWH5NEdke8zr0mhYf0CN2SvpYGOckIYhmw8JvzkQc6AXDiIydzIlSbljVDC
         VA3w==
X-Forwarded-Encrypted: i=1; AJvYcCVwrKrqZqTbzSyKVBrVtPnbc7GM78HXJ3wKRTboqt54eK2cMZE/taQGDL2wA2QtFKUPoPcTNhJrzyA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPw5H97/1OsJZaxlzHGJMJk6TwoDENFIVnlaYhwVLj6J8x43UQ
	E+QOGEZmMTf9+mFY2W28Ra93cBDK5QrCdVzkmDQiQU/hNt483ptpbXtPYtSzLGoEys7Ri5DuthK
	Dj6LO3TDyHbUtjXTVFqfMmu0xG+VTuWrK6+x6MABrhf6GEsJPZF2aSRGWYgLrYbU=
X-Gm-Gg: AZuq6aLRYNDElF1fEYcAibkHGvWcj8BJGhYaqV0Xpz2eW1F7eYiEaMPEXb2TjIgRlQb
	v0LWFk7OlJslTazw81lcHYPmqEq3vjio2DBDXenUog1Gjs2I201P85XWSZpapQo06Te/EtcInC9
	+2cKExnlMaFlx4p8Dy/N4XX5c2SThQOgS9NDHR+cL62U2tZpgILp71ReYJV8mZL2gOTIliGoUsA
	Ur/NBZQSD3Z83f3XtzzCDEo7ntM+e7kqXQbUz15Xnnym/fxd8JQQ1z7On55MIzImy4iWKYtA31C
	rZJk8uI+Nf0hh+mK8IgjdLdfoLpspVFGF9SnoDxLnlqiFlM4BWfLkMtgpBD5KC9nIGSqasYSZg4
	PoS40rPHvebXEFADrnBQH33FBV8xdvSkJuANC
X-Received: by 2002:a05:620a:19a4:b0:8b2:e9e1:400f with SMTP id af79cd13be357-8cb4224b5bfmr1439784085a.4.1771329149050;
        Tue, 17 Feb 2026 03:52:29 -0800 (PST)
X-Received: by 2002:a05:620a:19a4:b0:8b2:e9e1:400f with SMTP id af79cd13be357-8cb4224b5bfmr1439779785a.4.1771329148403;
        Tue, 17 Feb 2026 03:52:28 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d92267bsm769676135e9.0.2026.02.17.03.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 03:52:27 -0800 (PST)
Date: Tue, 17 Feb 2026 13:52:25 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC 8/8] arm64: defconfig: Remove CONFIG_SM_TCSRCC_8750
Message-ID: <nlx3bt7uchvloqs5kutrtxawq4auorptpp2egjz4wrtepx5zrb@yoxmohxefwgy>
References: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
 <20260202-topic-8750_tcsr-v1-8-cd7e6648c64f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-topic-8750_tcsr-v1-8-cd7e6648c64f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Coyys34D c=1 sm=1 tr=0 ts=6994567e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=DpAI_w27UE3fYZUDY1kA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 32KRHmgmBMPbrQMG7bqdVJlj3TcgrTLZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5OCBTYWx0ZWRfX7fzLPAeTeSvA
 oa2x+k/UN+xxb/jYKL+O/eht4YYCYBFNbdRqH7SICVBNm7gV4kpoXo64Mb2Jd1drNKaiAsoOGw1
 eQVWI9OJ6fq2sijP3S2iZyxGu7GtrlfG4+1cH8Gu67fG7eTIrGlKvE6O55kroZPW15Z6rzH6j3B
 yQvSSCwAv3HuP8jIwp1r1zGydhHrI2ldnupIWd8nFp5n41C7v/VwSWysPy4e5NjEAuOXluCCOby
 z6AhmueCychnLGgjbfAzgT+PfMjxu26ewg2W+OhNy5/wrcFPz5De/ud31N7yKH73gHOBf+095Cw
 IGY/QXeaOpPA814A5VTh+uNjasSpnKWjoLLqVNQMMXzy46HUDdiyTBeh8nSmhwASDiRKXvHpC24
 eMD1ySK/cKMOgwFjARFx2FwiXYo3okA+7XZEGgsj92iFKYiddA3ovtEBU3uRkQPSbIP8KIrrWCE
 rPNr/nalHJS1dCxQEmw==
X-Proofpoint-ORIG-GUID: 32KRHmgmBMPbrQMG7bqdVJlj3TcgrTLZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170098

On 26-02-02 15:57:40, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The driver and the config option have been removed. Clean it up.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
