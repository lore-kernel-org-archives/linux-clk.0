Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1969431A7F3
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 08:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764146674; cv=none; b=i3p//CqYUzOC/BGrOTSCaq+GhRU27SHHMzQr37vUVE3Sf88aAdJh8uig1ljyjoA+IJZscpBj6D46aUeLuqnAp+eJ83ZBBqSWZLDF5tMP7s0z7f6WHFlRIx0AXTALOUCuSMGGUfhMBf/5FUfBl2ht9GuGzUFESXuFMAK35Z2Fqn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764146674; c=relaxed/simple;
	bh=HvNXYh//mQGXf6QEF4QL0rD5XPTMfG3as24EUV0OFGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oiQqMSqA2aeW8SGjajDq6rqVSW8JEmE5q5glulr83latmXgNENe79YRw46VDQdZ+7CEWihDXYccBpKsbV6/tEH7f05g5hrpMHDwuoDUBwPj0HXSdOpvjNUvTdA0/ObjY1pslzu+je7A3GhyQm8fLRwW63CeeC5h3eGWRmV/3hjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jItJ64sM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kbue/Nez; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jItJ64sM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kbue/Nez"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ6vG2T1458391
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 08:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y4IQ58ZVPziIOKzmlGQsvDpH
	xpdq9N/xPcgK6RCY9i4=; b=jItJ64sMtFvybon91vxQsa6HtBJODnPveFq8VW4D
	R4tqop1s90px+mVGv5WicfJ96Qz3GR1an8AeEGsl26oFW7vDQf5T3UOov9UEH6U9
	lXmA/S1zgdcKUhV8blEWx0Q8DTic78jLwBqZGjjR+W/ezWgrv+iyqu5Bx1vTdxdC
	zCDt5E5pJiP3rJcqH24RXxPNtsFjBdW7MTvJoYZXOmC8GfwlF0/qs6cthL1whCiH
	ftDzxypMI3ErKPaJwT9j2uZ0meyqf4VV9oA6GCwTglZmHBXT+quJ4rgcrxtduUuR
	6brOGvneCDWstXulu+KKMsEPFYgYUc+dx4Sm0TCz0fVd3Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anvqvg9pb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 08:44:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee3296e984so129367031cf.0
        for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 00:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764146671; x=1764751471; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4IQ58ZVPziIOKzmlGQsvDpHxpdq9N/xPcgK6RCY9i4=;
        b=kbue/NezHxBKJ9d9V9MnndI2R9vziybYuDNTXlOGa1PPhNULztAY1DwKfs0eumxH9E
         Xe5Bgu6CzNHcfPON1EoB81MyIATIpDV9IMwISMxEKcFWHXd5z6/o5ipEMyzCE1N45l+8
         x9T8RBqcVLB5LCnU/H1VFMN2lW84CzEuNckQQXYLf+wQjImqbtMc/BvYPFNqb0wa5FGn
         ZSfcq7BXUzA6ZmsHpwAJ4JQ0IVhG/IBntJcoONt7y5paP8/Akc0oYJqV1giN5x9CWJEx
         H09u0hp2inQKnHke8k/+sjKYaY+AdUhVwbMA66Zs4MuVAb3Vfap5IHRWYToni39L4nCP
         Y/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764146671; x=1764751471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4IQ58ZVPziIOKzmlGQsvDpHxpdq9N/xPcgK6RCY9i4=;
        b=tnV3hqLSSghxHOm5ZJDhOuAyOwYINQUxHlly1Vc2eHoNTnQKKbNDOlokehYG0zs3rp
         cK+9XPPlsP9H3MqpUinXYaHKdklz9CdsNJN+AZU7rYgcMcjvkjl5U2b3VX2k7TXWdD0U
         0aHA/jjrz9iWckV3uEch5t5pmlSDXD+a5p4s7kFqEt+Ep4oDci7X/gNy504mKJp+57b6
         zc4Ta1xn4vqtG5z03jQMajP4vk0pK/7kweIHEbTTqReB39hizbnDbIjGiHoqIxivcUxy
         Apn8SycZigseWlTQW1ts94ml51u8nCX16Xzle5r+E/CMIV3BasKCz9mbRHI97nWS+lYs
         00tw==
X-Forwarded-Encrypted: i=1; AJvYcCWYYpHQyyRLNbZRVaJRBY5vjb44hB75a3gmpiM2KDf7Gg840ak7Bz8KRiJoBZiz55A0pwoGmdAlj4o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/ka56KALjS7R5YXwINnvVkUNcUUmwp56Z5+N9qbz1K/nNOuO6
	tNZAbAqYuo0lvs+gkyx7Yz2Pj1nEzzhRNrlveMyxeKqu4eLHwAgFzpuiKuFFDDjtszCR9BX/zWD
	XaDKPs5cJ8DtnkKatwJ2T1h9jPOFn3A84MiBmtf/Lw3iQVe2RyoRKpD6xTAoi/2w=
X-Gm-Gg: ASbGncvvDlLIYc1pyINIldhKuK0tuvu8+ZaC5QIiXxFxP2a42Jy80XP8CIjYy5o358P
	lM35WKGvrCBUZHHZunA9I1y+P6nw6bv6/oP9p9+GzwXN7Uwt3QFZZ4G7kqBHgqcneYIUDf6PvV9
	g/CeJnTOx7HRq5G09Sl2SzB+8+i2LLxNimfm06x9hqIo1GUWuQuKicFjL7BBNGB4drQmPqj589y
	Qvys7JLwJ+Sr4RUgt5TluT+iv/iKUE8mo9Vq0/69+auskzgLdGRkzY+kkWypcZR3E/5niQE2jyN
	PcXHWiKIqqhrfcrXQEPEbFlTPopPDOo4XwndcNYYqH85Dxc8YkduPZmRiclQ+AiLbfoIqtS+9EM
	bKvzJ6/8ri1ECxv85sDvZV6Hph1I0mUZWRz3Lw6dL4xDvYR8xRx5PCvZE1U+2lbW/tOcDw+Ayhl
	WVORWe7rQX1o3/0Mlphve3CY4=
X-Received: by 2002:a05:622a:2d3:b0:4ee:11bc:bc98 with SMTP id d75a77b69052e-4ee5892e190mr195381211cf.56.1764146671372;
        Wed, 26 Nov 2025 00:44:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFchfpqe6tmsaM891d6sYtBdBKuLLdRyR71Sxq+UwKsBvTdv02l28hIQTG1NoqZ9BTJlPK1zQ==
X-Received: by 2002:a05:622a:2d3:b0:4ee:11bc:bc98 with SMTP id d75a77b69052e-4ee5892e190mr195380901cf.56.1764146670925;
        Wed, 26 Nov 2025 00:44:30 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db86bb3sm5682578e87.29.2025.11.26.00.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 00:44:30 -0800 (PST)
Date: Wed, 26 Nov 2025 10:44:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] clk: qcom: gcc-milos: Update the SDCC RCGs to use
 shared_floor_ops
Message-ID: <fiwdrwhicd5fpzlfgxim3lhmkfju5qbplbbbsvlgypjure3vms@vhzxwabde2wr>
References: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
 <20251126-sdcc_shared_floor_ops-v1-5-9038430dfed4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-sdcc_shared_floor_ops-v1-5-9038430dfed4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3MCBTYWx0ZWRfXwZq+Bx7P7kNH
 AJs2A/JJcsNDlDlK34hY2W44vUMQhqNNlQUH+ZrDVbvjpJcrDeKy3Kcln8QCNHnQKDH/HDyqijf
 23DutaFFfRNO3ryflQcbYh4SXA1AvYUP4Zki6+kZjTkROveH7E5RxBvwyBetDVe2WrGjAKPjuK+
 B/Ak88h31JftbxrVEBCcM3PVana561zqEp0tqWKLtN4VLewYhzK/pNSyqBl3ojn5Z4unm+I/vp1
 jU2KB8lfO22G1CUhVYf3otu5ozYEeyJgUk0TaS+OQAfQmXdxUPCvIVfZlBX1/A/gxhPbGtxZUfj
 psyQbJydatANQETWUUEeG6GPhWyR8tOq5CZla4aLWSTIK5BEPGUodE1CRUlULxa/IiSLMkGFdQq
 750FqA7pkv65C7oGGaB51UXaxxUaxQ==
X-Proofpoint-GUID: -Zu6psac7-7KjYqAIv8pKHxx9zPSxN3a
X-Proofpoint-ORIG-GUID: -Zu6psac7-7KjYqAIv8pKHxx9zPSxN3a
X-Authority-Analysis: v=2.4 cv=feugCkQF c=1 sm=1 tr=0 ts=6926bdef cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=9PM8q560xgosQWX9dScA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260070

On Wed, Nov 26, 2025 at 09:45:54AM +0530, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs to avoid any overclocking
> issues in SDCC usecases.
> 
> Fixes: 88174d5d9422 ("clk: qcom: Add Global Clock controller (GCC) driver for Milos")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-milos.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
