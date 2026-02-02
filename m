Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323932F5313
	for <linux-clk@vger.kernel.org>; Mon,  2 Feb 2026 20:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770064559; cv=none; b=Cyk0Srs9y9e78GIGzHGcWfvaf8sx2qEMGFCQQ0fi6JjOfkw+U7Wm9tkOiNw5GA1l8ZyKpw48rjF30eIzTqmuu783KUWxJPOJfMRS6xfbzgNBd6WcUwWCinsGVFQ59n0SNfwej2TqXiLa230JKjVhVuLA6yXh5dd0eWd4+0L7+fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770064559; c=relaxed/simple;
	bh=H5UIDfvZDYPWcYHdhQVeTv8EiaFtcIq6QkVj/IuBjFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzU+emZCiyEdWV1n4zeAcPLP1ZlF7ISNe0m6x0899ETqKdsrOd7pCPcA/78ZWQQbXJitIJPmFnGhTgWSiAaVdKn4rRELW+I6mBGpnm3hE6OUluE71GlhVNIHdjYfr/vRT96ue4DOCzMnQxHAg2VhLh/undR2oowB7y8QPjYBcm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WvGbhDif; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bz/SleT/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WvGbhDif";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bz/SleT/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612CVCBP255014
	for <linux-clk@vger.kernel.org>; Mon, 2 Feb 2026 20:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=slwaR0wTtsDqaLIEA5TT99Ty
	E26IITdacHcAuzrsvRM=; b=WvGbhDifuDma9Y8uRCIOTD/M2/UXWD+nzHL8zNKL
	fi/hxMdejOd3PUf15miIT9koYUAmnWU6lP5Fj/u9f0qlHIpPrQAmCxl6QIXLmmje
	VORBI48XHOrYrgxvv43XtCNPpAOHxamPbjXgEfJOJR5t27r8bLrNiyki84kj3GK5
	LxJJWRY/Orx2wHccv319cRp/twiU+R6a8h7tucGWfER75GKhcaONHYD/PvjypwrT
	mQ4zCP9zEh961BeRwIh/r/nq+T870s+m5JUP6yrfSwX4bpzQHyvg1HWZoP8Prn4I
	ucfcbrsb8NxaueACDOEJ/HsRe602xHWel1BSNGtDNUktIw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0khgj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 20:35:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70fadd9a3so1750490885a.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 12:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770064556; x=1770669356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=slwaR0wTtsDqaLIEA5TT99TyE26IITdacHcAuzrsvRM=;
        b=bz/SleT/laJnwXP7HYNi2XuLDxyv92kmE2ZBgKLSVJeN8ZJG3H88gZoT2qFYTpwzRW
         B6JvEaxairBC3ExcmeFMmiXZO8/jp/qwIN1XOKDEc22J9Vk88qNgYI6a06BI7SAp86d0
         /WcITCdfJgbOsNM73eQB2+dkzKXeq1LVnZF+ymaUitc2//si5wD2T3OyBbSud0a1/aCe
         qKUtZTmKk6LytPS5qcQbDcxD/7HS3Pll/nirMD/g+MzBOFdw80Tzqq4DhdrMb2n0MlkI
         ukxyHldMJuwOyVrcTJqd9bvpyY7sXV8Zi+zYsgbsAve7G5zh98knyUxVsSf7bQduSC1J
         /vPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770064556; x=1770669356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=slwaR0wTtsDqaLIEA5TT99TyE26IITdacHcAuzrsvRM=;
        b=MHVembbn4A+bd2yzwnSgIJWu3sG7gfS3jHPCdv+ymxwTrLI/9nE836Bq+lCgfZ88Me
         RJkJ2XM9ksGDmDYiGr2lcboWbzxEblWAhU5qAf7fkANdLjuujAecpcAY8XedFrLF2b70
         3jg8aBItLnQhCQ0mRyGxgHTjftZZF2xu536rljKRiRoFoLWSe2VkoaSQz+DIYZPwKvfy
         g8LEDG/MRvxm5MDYkEw5Ct+KpZLCnduS+PoS1idg5XUmamNTfTxRsqnJRYc6o/Bj67+5
         WLbo8qedvnuttxc0/jTnVKa2X/AHABBVgZEBjx+xm5Dfq+fUMZfHWBpmf0Extkl/dWLS
         rd2A==
X-Forwarded-Encrypted: i=1; AJvYcCWcakj2oYTSXklvrGmxn5EIxKuh3ke0CZ/R5c/VwWte1r21B3JSyCEBy3zH6bxsQPr3Wa4ZatF/PPk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIDXjOFiQnwU8J9niUTU5LGgduKsY9N2iv2+FCjZpwsJN6FVcv
	NFuyGEIabIeAMXV1zDiwQ8ZpNlg7dMTWvTV/fXWUghxMEmcGD/syPB8S1ouf3zPREZPs1SiZhUr
	bMvzVQsgsfW5On3mVpXQpVJaQO7heK71BhvRkKDv7YymCHIh4VDv6pDHcxUux8RY=
X-Gm-Gg: AZuq6aIrKOjcs1zH7/KzV7Pt5U14liikgMOwvU4aLnTpDtqan8NYjU9VP95CK38lfuz
	kbq9tsLStwau9Dnx072EzNFrA0sUMDgJAQ7MtgLSU5Jrs2DPukjKCw10QaOFpjAmnxcrvVaoWDp
	Np1+8YTZCECHPA//lLyx5uR2AGvQAcYIbymMRbTpjmHMfopMOdHpTOzAFU9uQ0OLiMJHeXwQtb3
	G6Y/QJaNqvGIFVSMU+NeTXdrEn6so48sUKIls623ZUb0s/xnxAn1lPqforKkxl70kEpJS1s2eNt
	CRzXv9PDB2TGowMWuHRp+Bz5pg9V6Sg8h6qQCJXDlnrZx29MjqZ7M/lwYIfdS6SBuGvGLvD6o7D
	kMWPKn8F6twZ/YGymZWjyLoW4kcWWUz2JzM7eCNfpl4r4CIjPbJ1tWWt8gpk77qeExxROW7YsXb
	CxHNFhzN/zppj/mj4nzujTU2g=
X-Received: by 2002:a05:620a:3941:b0:8c7:768:430c with SMTP id af79cd13be357-8c9eb301a21mr1801974785a.68.1770064556405;
        Mon, 02 Feb 2026 12:35:56 -0800 (PST)
X-Received: by 2002:a05:620a:3941:b0:8c7:768:430c with SMTP id af79cd13be357-8c9eb301a21mr1801971585a.68.1770064556009;
        Mon, 02 Feb 2026 12:35:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625c8dfbcsm32799151fa.22.2026.02.02.12.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 12:35:55 -0800 (PST)
Date: Mon, 2 Feb 2026 22:35:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] clk: qcom: gcc-glymur: Add video axi clock resets
 for glymur
Message-ID: <j2orj4ugtgqkt32snnrejtonopt6h5lwu4yiaqocxq6v5r65wu@kifajuvaudsh>
References: <20260202-glymur_videocc-v2-0-8f7d8b4d8edd@oss.qualcomm.com>
 <20260202-glymur_videocc-v2-3-8f7d8b4d8edd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-glymur_videocc-v2-3-8f7d8b4d8edd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Reqdyltv c=1 sm=1 tr=0 ts=69810aad cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-zE5Bsz_LXmV53O_SacA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE2MSBTYWx0ZWRfX4ssjNSSWsBIt
 p+6iXDpHUgXEy12HmZ0fZCvGr5IzpgSNv3azC87zC3NwVh8UsLqAvWMQB4DjN6EXG8rRlEDdY9J
 PkANT2uljB2iWW3nIX7wps4IThVGEj4BweSAixEGy9Q8TUUvyhGdqYhsDI9abYALAV/D9+vrxe+
 rm32Emy2dVBNWLq6dOsZxJzlv7cldIMZHnVsoIW81j9U5uT3f38M9/Kjamf34kacLCopL1dJFR3
 jA1RJQGZ3R4XzwieCuXYu+s6cxNFnuF2C93wp59YUF7E2XUx54WXraEa+aLfwSI/x7SHbW7CMMh
 BBiKuAvp6jR4XZnsYH6hi2C1Ab4Cgb0vR/3y68AkIMvYuKQu929rIPv6cajKFCnBAxcpRNTEYIt
 GQKQq8FcLLxYswev57fBO4wVoGhzjOsiXRjesJKKD8ascOutAAxBohoDo+BniBQ+qe0RtmC3Ntj
 I4sABrgsHrvhMD4Pg8g==
X-Proofpoint-GUID: kzcYnPkCkr5vc0MYpb5l-4vbabqKxb6o
X-Proofpoint-ORIG-GUID: kzcYnPkCkr5vc0MYpb5l-4vbabqKxb6o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020161

On Mon, Feb 02, 2026 at 04:26:52PM +0530, Taniya Das wrote:
> The global clock controller video axi reset clocks are required by
> the video SW driver to assert and deassert the clock resets during
> their power down sequence. Hence add these clock resets.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-glymur.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
