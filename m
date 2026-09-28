Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AF045D5D9
	for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2026 07:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582129; cv=none; b=PfpGSDd62j5kylhw265MnR2Mp7tfQJtLC8j0uwZrE+PEMnBt6HF/8asnd1IXZzQ1Yku1UhaTjarDv7sYrJhKvNo5hCOBUxGO50nztVGtY7CaZH8BDTbmJMi2uaxj17lltrFMm2ieHJ+p9kQpgSlsfwnGzsZz3BXVUlfs7hGlkAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582129; c=relaxed/simple;
	bh=OwXopbR2w21pBIP5gXcOugLyUfbaGJBgXhaGWdPvL+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cs1p8vxNPKi6fklYvJESvhlr5Ta4lk9BuK0DDQ9KHfZvQ/Qsqp9e29qk0/tYPWnKibBHRDNzHHCy8HZDaAK3r8Xha0n4QfnUPHiQX5UhCZ82s4auPd8E60BhbW7wyuEkH+5uHh0ukHa1oXmsgkp07mmvVAkCrVwOnN0iR/tyEOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P4fcd8un; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UpbkGzWn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P4fcd8un";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UpbkGzWn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S61aN2772114
	for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2026 07:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8Pws+gm99kB5WMU2axLLCeww
	zaScymdDd//vTOflTyI=; b=P4fcd8unM6dq1G2Z/BE8UYZtbtGPLiYNmgKKcomM
	nwLNxvkuTGhvXDbRqKYpKX2VoTOCr2E47C6N568DAP6t0aLpIaJh3SLIK9ZpWAIE
	nj7X6CEh/CDEfa8CzUlNjijDf4G31RYa48iM7E6xsM/BIxiiJu1g7b4StMUg69dX
	jxC7IY0DedG166fIXzAz+QtT/xHqaHM+sMrviglx2vABNcSzwZUGJaM7fByaE3S2
	frXXTA/oqn30xnOuSwcQY85rKJtlVkfTd/SRa1b8pGg7nlhn3+UmcbYIsuRSTe8+
	pvmG3xHrybGSGk0z2qWOOn8AmlcRUXOK/xc+FVvHexIHPg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjkxgcgr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2026 07:55:27 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-916cc44720aso6896276d6.3
        for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2026 00:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790582126; x=1791186926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8Pws+gm99kB5WMU2axLLCewwzaScymdDd//vTOflTyI=;
        b=UpbkGzWnHuWk9P03ZZGvXOEWuiGazF3lDyJTBMqNVSHRvzwOh/6ZonOtCkM4AgcQJY
         nfMlY8ifgtTFKqWR5hwVVzmeKDsIa3TVoeB4lARMc6zuMXxICfXXrcMqVWope9qmebpP
         2WwFuuG1Pd4Tl4dGZLuqLYpA0fWgyfiy124GPLo2Vaa7YR0R/W0scI62EOOl3vUXZU7m
         HDHB089qHaQkvAlztsaj0GgOUwusHKOgvEGtb6oJHg2SXXnDNekwOs2F5dkRMm3w3x7K
         fHqEOr4MagpScRLPYyhwJZMHVijBbbT1tk3RWf0H8AYhsNZtNZlvZMWH0oJ5i/Qs+iTJ
         I9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790582126; x=1791186926;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Pws+gm99kB5WMU2axLLCewwzaScymdDd//vTOflTyI=;
        b=p+XS3S4SkGomnrWEEGs6aUTFUm+3m8GlC7ZWqPdgTt/OhTrleVS0hxGTGNtYyn6o92
         4OzW40PPtFv34U6K/e18cP3c2ICqPDYwYzwiye33LkR9oME1rWtUGHWkVmrTpr872Gro
         THM5KuboySZWUj5HeC5tm8QgZM1aQQXshUrmY3/g27YvuN4uRMmhQyzzJBRcIBO1UOcc
         OgplrMOFzrLV+HDK+s7XkcO/J8dleDEdMQHn2I1TMVje+hFLTfcbdnnph1eLZH/bpbQ3
         JTi/RvpxKhnxVTw7gkMCceyYnJcnvYRmiMKga2EcLWZ58DhLKzRwv438nRBrnTewcklP
         Qt8A==
X-Forwarded-Encrypted: i=1; AKwUvBy8DCGIrg6mcICDVPbD7dOsuvdZZWM/k9fL5Jle0BcExC2yeIj4X56RH0izKVWx+ffLZVehxzJgE6w=@vger.kernel.org
X-Gm-Message-State: AFuF++no183J6rGcYpm9mvaPMLcx341Smd8ZfiEFBvvWEq6D1TVONdLG
	3D6ScjqktFR3o+/PkNAoK0qHwq/wGmEUgO3zSa/qyCC6dF7JGPU8YiUPbE4RRSAO23BWVxF44gH
	PKiqITthg3o2XPH4GO4ZNv2y6GJ6czpLScDvV/Lm7eM/T2y/cut1tsocJBFcy/qyS6tPdblw=
X-Gm-Gg: AYBFou3GpafxENwdrbACRS798LGWOs3A7dZHoFSJ6i54TtAuTARxCZ+6o9e/nECzkIC
	GyaeCDlTq/SX/P0QEcmVR4B1nLEFT8jDIhRfK5II2//f5eBaltxkIzTXjNvRXDhbZqdMsdDRCCz
	DsovW5h3tLgFdyxgSzpvBnKr7xMD+JOdtoeKXv+FWr6Q7ghsEIwh4FpvxdZMUQS4kC+2+JzF092
	gBwZftyWnQxsekoUWKZVnkHHVrkd+8qMinDBmcwKBMFYeHnc0yDS2rQFtbo2++i9PkNYTBb3uUT
	Ls6AeLIMX35MUhgn1591tdmJviXSxX9Q7zK5zSaOJp3m8nTbXyYgARSTBykquLdCWYxbMvNOwRB
	x/z1wuuKC6WWz774=
X-Received: by 2002:a05:620a:40cc:b0:93b:c025:8508 with SMTP id af79cd13be357-93c43b83ca4mr1786053885a.8.1790582126362;
        Mon, 28 Sep 2026 00:55:26 -0700 (PDT)
X-Received: by 2002:a05:620a:40cc:b0:93b:c025:8508 with SMTP id af79cd13be357-93c43b83ca4mr1786050485a.8.1790582125654;
        Mon, 28 Sep 2026 00:55:25 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0018f3e68sm120089755e9.9.2026.09.28.00.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 00:55:24 -0700 (PDT)
Date: Mon, 28 Sep 2026 10:55:22 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: camcc-nord: Correct camera clock source tables
Message-ID: <zxkf77hia3r6xxohrfibovncospnr6zvvrfiiznnmug5mkfsvz@2mpxuu4nstti>
References: <20260927-fix_camcc-v1-1-9fe956f01f6d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927-fix_camcc-v1-1-9fe956f01f6d@oss.qualcomm.com>
X-Proofpoint-GUID: z53WaDue_hdaoPRMoc1KmLCUCJJYFPx7
X-Proofpoint-ORIG-GUID: z53WaDue_hdaoPRMoc1KmLCUCJJYFPx7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMSBTYWx0ZWRfXwRNFP7x+XIJl
 /aN2wF5G0p2fPhb4MWnTmufrRIxEff2MZwRazwl0Qy9x3rN9YPIoR/lumDB0wiAbX6GrJDsv2ck
 Pw5yxeyK4uT7JV72Am7IIAq89lVP2j0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMSBTYWx0ZWRfXxszHsaajVSnp
 pygkwYpa6OwnydeVMBqB3UWa9vkll8scQF8029jq3JbyvokGur+KkZSQwPtrljw0G3lAIoGJqXG
 c8rj904ommQO4fcgqvqzCr/O6vBbFc6rxUyu+fpMcXJthDK8t7G7BSGq0IzulaXGJJZsRILdq0g
 a7g+iFcji6Yb9CyjYISCvVBl884AY7a8kROqqpuKYz7mW+F2ZaJL+SOM/MN8/kaQJcTKLMgHjb2
 DwgaDz9xp6GMbB7L8974eVYgwsWNTxy/67AdGHewQCDRVyQjgNumf55UrW5bZ5QN/1xR62v5AAY
 lMGsHCA67bm0RaA3lAf9pPxgXJf1QJ1BPEzHxvS+qDxBDESLgf3yC24W7YRpavM5GxMuPMpv8i3
 8b2pFf/kSTnutikzfALiUeJosD76ZIm/tHrCtTlo4KcOtW3oRog1/dw5DwpRaRu8SnqVEYHAIYr
 DBUZlBdD59GJ9hDiVwQ==
X-Authority-Analysis: v=2.4 cv=QZfzLcbv c=1 sm=1 tr=0 ts=6aba1d6f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ZAC9QuG5zvkjJuggSecA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280031

On 26-09-27 00:07:10, Taniya Das wrote:
> Select the PLL0 odd output for the 200 MHz and 400 MHz CAMNOC RT
> AXI rates.  Use PLL0 main output dividers for the 300 MHz and 400 MHz
> CPHY RX rates.
> 
> CSID and IFE Lite use the CPHY RX rates, so share that table rather
> than duplicating it.  Remove the unsupported 300 MHz CSI PHY timer
> rate.
> 
> Fixes: 7647815dfc8f ("clk: qcom: camcc: Add support for camera clock controller for Nord")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
