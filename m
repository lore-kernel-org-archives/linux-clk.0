Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DC937DAA4
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 11:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707550; cv=none; b=bovxLBW2m+oxHlQBYZTDzqDDhbb8i/EJATSFaJO5urguovw9wt3x0GyGlXEMXnXpPLPfaUtgREClJXPO+p+tFoRIKe3RbgnAkUBRf7tSy51lNjGDfI/BeN+CIvB4yjANzlADC/XC5ZMDRi/ZKqzThJ9XcSKCSSpFmqp0PdKjGok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707550; c=relaxed/simple;
	bh=V/oea6YVUd79ay9np4Qf5CD3ZT4bLrGCN7+T2AQLokU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ODveBVft84OfIjS4h9a7vhMQQSGatmY08EmdFeLlA3k6bK3RQWbW2TOPi3WnxFsA19ID6+ZwTdwPRgP7/ui+CFuA0UQUqg6rF2R1CQQzWCHG6uHVOPdn0vNN7BUOsaVBq5gA2fWUhWC0KoqF3x42yu43lQegPgOdLuu6PNEbzX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C/Zg3n6r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VhjcEcla; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C/Zg3n6r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VhjcEcla"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7MgOg877595
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 11:12:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mNbFyNHd6yc6F3SvZBtMoTUR
	fXgxrtQi1GfKV4+Tz9o=; b=C/Zg3n6rQ0L8MoUFWRlOYVxnkaPKV8yxzl83gPLn
	qpSCjIgi4LoaGGV+qBRYhq11ZyWbHBoZhyCZTZ2ge5UqB8VmXL0vbwz2BX2xQnc0
	cJqZFc871NmipAdt31lwABPG8c64qh0zZJOVW0QCbSo0/ZxeKglt5lnfVxyEc9Gv
	vCvzMguAp0WwuRCOFqgBf2ADM53/vYEgBUHkJVZfPLXdTeIcd50e2nKVE5Cp+V9S
	O4SWQgGqKo6Guuo+kzn1gPyb05OezPajqnXnS5Nb1sSRimwEXlHGaTvqhiZQY0ZY
	wHNtvaMb5tm4wvqLLOnvaP7r3hJIuOn+ELNwGLBj2aYaIg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4f3ebjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 11:12:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516d1a8a6c8so21835421cf.2
        for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 04:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779707547; x=1780312347; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mNbFyNHd6yc6F3SvZBtMoTURfXgxrtQi1GfKV4+Tz9o=;
        b=VhjcEclasa6YhbL02SOzcEwSiZAElhzMTVUz6QOkSgn4gpc6XphVshmlEv7nE0Ia12
         dr8LSCaQo0sKMNxsLBJz9qFJfHGNLel+4Si4LeTmebtNLNFIu53ol8l/sLHasdUIQzia
         NOkycIt0gHMJJQ+1HoHtu6etK72ntHp1Ehg5RgxCKNZgrtbVDR9k7e4RH9JLt2Ixc4Cf
         5ILyaWjguT6l/HIO/Qmh+GbA5whvlPY0ws5hX4SgCHhRDD/+EknXXFB3hhArqEXpXnNO
         DQfjkVmoTpKyUd0HIJ+xL3EJBy/XgvsL5gN9ZGW9nTyqZZEEq1brc2sZ0jjE8p9yo299
         roKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779707547; x=1780312347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mNbFyNHd6yc6F3SvZBtMoTURfXgxrtQi1GfKV4+Tz9o=;
        b=CGK87WvrSZP9b3wRlSqW2NLh0E2nsuLEmmnRIEyso8Mr2X2y0V0FU/4xXuc2QK6a/6
         kGCILh9b8xUlFmuPxfP1OQcFMcyrGiAGtjJf8+ZNY+vS5WOQFWJgFvjL7kCA2jsn9Uwb
         jXpuNoEq+TF+1AAgSJE3ci3BGV2UY4Q9Z2ZTrIFkSDwcWbP4oIIQ+ox1kLNDycwoP9xE
         LQqau5PAtoRdJTFbx/0eVtJ8kccLZNqu58GJGliLfNws1yjfyG5MWcwjS/GZ/R/IwEXi
         a2NOldw4RglzvAvpZXeD7jKdu1JA0/fV2yp+DOQU2Jmg2NQatol7mZxZOpXheRJBpRZP
         DhCA==
X-Forwarded-Encrypted: i=1; AFNElJ+aqfqDl/J8yq/GBjRIYztbah/P0Q2ItQZ6TNV/tQuE5mBzooGcorWPbYHOYO/myEJlw0k6ks2WZVA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjQTF99e9WA9AGkrpBvi74gjnllXKQJ0qMw4cN7gNKcz/oWR5Q
	n+6Mx/QR/fi6WtbJ5bC0966GUonOcrSA5kk5dCneIFQzsu6DYW+lAEU/a5h0rJ5NgbLk55EKnxP
	HB2uVonzVAidW2kdfhv35TCtWlr5OP+sFTY2vONLLwlnUflL0ZfoKrQJ9Mh3JAQw=
X-Gm-Gg: Acq92OFpWthgIBjYZ+YFoUYRVUTYjXRXQjjQGToBNWyvc5lsiM0oP88e409Xri62lzz
	qA3KuSKPKky2khX2NH+ESRIkMtBZY9Qil1VmC0lzxBnVmYxR3zN469VWoCSOPaNPCpr9HGCy8l9
	u303i08RvG0HTF633jJ/PhDKxBSi49vigUi5pP6BVC1aRS4d7wxoeLjcXtyChF0W4qTbGRJqCuJ
	JHaTs5GITd5a3dLJMeYWi9QAtWjhvQcGZ6IbHsp7R8QqakkC9DtQ8uWnzs8L9s2zTIygmF1JDiC
	hAMbc+bUzH/rEtgZbjiuk0IjnhjhNnc8yznfcbw9oJLfxBE2dwR7xz/Mfj2j4H3YtkVVmUDJOnW
	bcYCo4oOkYD8hfzthHnsRtiBPxtiW6lmU/4psunObWZyIqbhUSR6/rAAsZjp+QmPUUZvq1QtVnR
	k3pk4kzp7NQ+17sVLfZNEfvWGBGK5R9U/6XIs=
X-Received: by 2002:ac8:578a:0:b0:516:e152:7a59 with SMTP id d75a77b69052e-516e1527d60mr118409511cf.42.1779707547104;
        Mon, 25 May 2026 04:12:27 -0700 (PDT)
X-Received: by 2002:ac8:578a:0:b0:516:e152:7a59 with SMTP id d75a77b69052e-516e1527d60mr118408951cf.42.1779707546620;
        Mon, 25 May 2026 04:12:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc2ecdasm22191671fa.32.2026.05.25.04.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 04:12:25 -0700 (PDT)
Date: Mon, 25 May 2026 14:12:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 6/7] clk: qcom: camcc: Add support for camera clock
 controller for Eliza
Message-ID: <lbixqj4cgausikhelm3iq5kamgmxf6ibhv67p6aya3fyqpdck5@ygy2yzntbo35>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-6-a1d125619a5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-6-a1d125619a5a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 1a19RWkz0Bs5tAIC_rplHOn7abVrcOtn
X-Authority-Analysis: v=2.4 cv=WvYb99fv c=1 sm=1 tr=0 ts=6a142e9c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=jdZfh6YgxIVJxXzoon8A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDExNCBTYWx0ZWRfXzDqtc3cqCx0v
 1N0MM5j7lW2ShuIqL+xlpkYMF0i7roJWfvfFdZaxEYJ5YFeVuxYeQyYM2EzQzIHhGkRNjDN+pi+
 S96cu7DTJGbfxjagAPCJDx9r9USgcz5XT27P1SUUSLzBR4ZPrDW21350xX8dERB/WlSULOHO/Xn
 A9UvxiJ0LcXUFIuxNeJuU6ZQ0KAmTilOSwBXeuOoCh2V1PghUUB9Yg5ng5BxXgMBC71xczyCe6V
 ll/SgqBJ+dE5145Z8n3mKU0g6/I/glrJmLECMBiE0sOir9DrwRHhNjmCi6WzitHzHWhaWKoD93H
 TGn9bEAx+j50ZdYIiPn0O8hYll2OS9S1FdWhiHyfqBP6Rw3RwRlbQLjp73RUPnXjrWr8qLMw+YC
 nIiF8DdYHGkik2hTm5jGj10kTP+MBirG4ifM1TXUdB1UGg04tPbaV2sIP56ayVgV6STYpCMdDYa
 YWIXtBRPl31fcLVvn0Q==
X-Proofpoint-GUID: 1a19RWkz0Bs5tAIC_rplHOn7abVrcOtn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250114

On Mon, May 25, 2026 at 04:16:08PM +0530, Taniya Das wrote:
> Add support for the Camera Clock Controller (CAMCC) on the Eliza
> platform.
> 
> The CAMCC block on Eliza includes both the primary camera clock
> controller and the Camera BIST clock controller, which provides the
> functional MCLK required for camera operations.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig               |   11 +
>  drivers/clk/qcom/Makefile              |    1 +
>  drivers/clk/qcom/cambistmclkcc-eliza.c |  465 ++++++
>  drivers/clk/qcom/camcc-eliza.c         | 2803 ++++++++++++++++++++++++++++++++

The camcc and cambistmclkccc drivers looks pretty close to SM8750,
except for using a different PLLs. Would it make sense to have common
drivers instead?

>  4 files changed, 3280 insertions(+)

-- 
With best wishes
Dmitry
