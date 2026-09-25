Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE80443C051
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 06:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790319309; cv=none; b=gTihVi7omgdrQCD8mjePe9jLgGuFaCZQLJtes9wpTLg061gv7sEZm1W/1d9qr03LDjUbGZTEXrvUMefMh4UvMvbhULBObHOktc9UKrQM+HbKTIdJzYUaqoUPKaLY4qvu/qt7OVF754LO08Cpm4Ufs/jIyMASFvHvcRLt/bfbnZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790319309; c=relaxed/simple;
	bh=urC2V/TROHH3jZ8x2AUGfzXDJkIFKGZjenmPfOmGKt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Opp0JAxpOFwYdBIpZ2qNIwSx5JVuzMQuaXOoGZG/RJdK5VYtXStB2kHSvWvSY00k/5xj3XJWVl1Dz+GdJDoRnzCgoH4JQBh67/lrSq4m44ez6vpsy9S/6qzHvuaaqNw/pUQLsmWOSgX5mDmsQA8IzQgeemw1JhHAtIXnoDyxfjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YQ2qN2QL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MjZHKLFq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YQ2qN2QL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MjZHKLFq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YpNE4102914
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 06:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+i1Ci6ISaO9TjrU3L28qZpsn
	0dc7H439NZYktOph74M=; b=YQ2qN2QL4ch+FFUMrykQD8VJoAsp2wPwT+vbL051
	SakrRUbrAj+MRM1ZDd6IsMWtYrLsU4X7AugsmsPUmm/NGVV/1fsWX4V4mWcSSPfm
	SeFW6J5Huo06U7B4YQHZGUWCAI+rDAlDDGPxZEVKg/qjYeUZNYT2aEgWvOQ9TJUk
	v9TqU9GhcTxojaTv5+TaX5Gifi/q5wwZsGzHq6yve601VFNHTSmN+jvv9gZjV6EU
	eStxYCoNBARgVYwzZE+GKpx5gxfXwhKraEU/4+PnV6O4sfS0oNVr0X0vLpWcGE7r
	m31xSnkxvrVar84RG6iJBAmpb/nvfv/POqE9k2zO3GeppA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw5q8u74t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 06:55:05 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-342217d8d53so61583eec.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 23:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790319305; x=1790924105; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+i1Ci6ISaO9TjrU3L28qZpsn0dc7H439NZYktOph74M=;
        b=MjZHKLFq80Nn6RtAd0v3HFSsfC8UxtBmPuj9VLSJB1IBVTmWBV4BE7y+yJR31gTlI2
         zF4tZF3jIXUaIHFN8jNu898yE1F0v6I4QPp95rgfpDLR1U0iCYU937vQiBAZKuObvJCZ
         BHUZRheMIgU3wY2MvvMVyiMt/152BIMIJeRvJg4s/FvI8FaaFybgKGciWaykJfWRWzHr
         k23HvHC5Dp9JVfrKd+IEZslZcKQCztzmymHQdrl3RvuBt4P0H8FX7I7uUFApMUhtG9Ju
         rMuU/1k8YfyJTpLC3+ZD8b9Pp0GnAqgjLET4SRVnHUaY88Tz5/0D7QrfUOaJAo/AwlXI
         WMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790319305; x=1790924105;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+i1Ci6ISaO9TjrU3L28qZpsn0dc7H439NZYktOph74M=;
        b=hqbKL+KzFXK8+lRraKL8LKrNZ1lhqhXl64mDZc6nutp9OFcTKB+KAfYov6SaFStGzw
         hd0X9+SEJ61Bo5/n2jdHePgF5Zbc+W/k4buuv3NHMqf++KQTbnJr2YXwtoxSJ08W5n/8
         2vtquP33glvG2XRD5ADHylg+HspDU3H527TY6fiSL9NSGrTUoZfJS40URHZPgDEJ7vmH
         WgNpCmSWu6WteYmwwSlO2q8eZnQmcz+ybfbHCzs8LxMCFTO16OT9Bc5SvZjbbg+73T3L
         f3n+WF9wDrSbLqbggDAnTe6kY9EkVP9zP7ZKu3srMTb88an8Aa8JXv8JUKCfZe/dTcVa
         EVAA==
X-Forwarded-Encrypted: i=1; AKwUvBzZ5sHFbrURfMeHqMsOYfSZrVmV1AH61a884etJvXLbC7wHUeKkziN87YPD7uva6aa0yb7e7dZU1ew=@vger.kernel.org
X-Gm-Message-State: AFuF++l8y1ZjYfCawPwvYZocNk7PnyYoPKw7jv5cMJjURwS+sqF9ZytI
	UDB0NXUaNBWLVtf6ZKpUh2V7zuPg4sLd9rprgDPzbIR6hfpsL5NfO6MIjZIpdvZ9mCg6Tkq2OiE
	85BsfThIIERYxNdqHrU4jDaH/4LrDObNrD1GpErbFfyVfnZOffTNug7vEizXtxTU=
X-Gm-Gg: AYBFou1bGy3Csq7jPsQw26pumCGGAAUc75AMOmzkDegds0O/83yPhhoa2Ws2+AoNfa+
	5kLQIb0R89/Wtq+djSm+EBEpIWHiGuGC7+rZvAzGg5Py5YpvNFIsF3fXQscnpUZGwIrUVTG+Wu9
	mvmaz0b3jl0daIc50TAaH+91JV/b77LBpk1ehFMubUwUIntOrCcVlG8tzM2LjCp34SDFS53wz+W
	YDUGtAfW8qN08/RRQLBt/N+VZB/w6uRuSoV06EEYHH6fhXOAiAxEkGnUU0ywV8OlZQACnZmuc9r
	aaHWCy8yc1JLvlAtu13sBs5Kwt2qImhWtgIfVrs/twJIDmL6OnrluEYTpNO8wcX8umbzKVvbeGA
	w3KGcZTABEvZvasL10ZwJBdA9W+4Hxz32si1Hu3USHA==
X-Received: by 2002:a05:693c:638e:10b0:33c:1bd2:1d96 with SMTP id 5a478bee46e88-33ffe33ab58mr3783070eec.0.1790319304663;
        Thu, 24 Sep 2026 23:55:04 -0700 (PDT)
X-Received: by 2002:a05:693c:638e:10b0:33c:1bd2:1d96 with SMTP id 5a478bee46e88-33ffe33ab58mr3783035eec.0.1790319304006;
        Thu, 24 Sep 2026 23:55:04 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3414485a9cdsm4130176eec.16.2026.09.24.23.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 23:55:03 -0700 (PDT)
Date: Fri, 25 Sep 2026 14:54:56 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: qcom: Add EMAC CNOC APB clocks for Nord SoC
Message-ID: <arYawDgjni-nMfjt@QCOM-aGQu4IUr3Y>
References: <20260824-nords_emac_apb_clk-v1-0-290767386bf5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824-nords_emac_apb_clk-v1-0-290767386bf5@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAyNyBTYWx0ZWRfX+sY7o+pNlGjm
 J7QhB3j6PIlD9MzZzpLzTSV7qZ381mGnxS/JnEAw59LVfrzWGG6qQc3zpy8KxKr3pdU2HWP/uvp
 TzEhkMKKKoD2REw4Hu4w1c6ZeJscSUU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAyNyBTYWx0ZWRfX8VraHRnjyXDO
 3tBEOTQUvRmTQ8Dg0cHZM7gFuKX4xLEozT1gMqWomNH6k7Q3BYHvAXChhSEM2qH6PePRy36Akdg
 R4J7DOk6cFW+1M/9PwHin6LHYLOulwL1pDPxbxrGA7jxsSkd1+irZ9DDrJBaGMcAxV4FqYcoINR
 GPIPnyBSzvWbmfFHtnnXJDZaZ7juYNy/Ee68SQuldgcEFX3Z5aPbgM6ul5PxkS0pREnvw55Vrro
 I2l6etHie0O/fN9xOWJfeCcYVt79027LgGUpgw9+45/XNc+6IbhZTd7liemKMOlXIClb+nxFk24
 UbdrnwGXF0NOHuc/Ku4gi/QNsa24CWouzn6VTzSWzjkOxrJmDYUAut0tLZg1j5emDRqrzXEDb+b
 lRWA/zPXZwgnp1Pm4Lcp13sUmp056Ex+REa1iuPyxsM9POrQMrYOPZZCfpED69o2OEJlQZi/C4U
 S/YrXbadcEScv/F/tSA==
X-Authority-Analysis: v=2.4 cv=SYRi5fRu c=1 sm=1 tr=0 ts=6ab61ac9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=rzbz_-ElnrvAUyxyaKAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: D4CwTjBbUpwsUyxBSkEkBvPjl6JKJDuM
X-Proofpoint-ORIG-GUID: D4CwTjBbUpwsUyxBSkEkBvPjl6JKJDuM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250027

On Mon, Aug 24, 2026 at 12:23:28PM +0530, Taniya Das wrote:
> Add support for the EMAC0 and EMAC1 config NoC (CNOC) APB clocks in the
> SE_GCC clock controller on the Qualcomm Nord SoC. These branch clocks
> gate the config NoC APB access path to the two EMAC (Ethernet MAC)
> controllers and must be enabled for register access to the Ethernet
> MACs.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
> Taniya Das (2):
>       dt-bindings: clock: qcom: Add EMAC CNOC APB clocks for Nord
>       clk: qcom: segcc-nord: Add EMAC CNOC APB clocks for Nord SoC

For the series, with Nord Ethernet related patches:

Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
