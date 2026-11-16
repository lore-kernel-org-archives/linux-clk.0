Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812665;
	b=f/cOl5nQrkzQmQIR7ZJ3gsP+zjpPb6vVDauB2RNoaeetI6a/ufrrEIq7xrw3t+u93NG2
	 gYmD44H9ZQMUbqcLfnilA2kL+lKtFA3LE499lnb7euLldvUMpFVmrjthne85KyCEobS0k
	 DkvKnOnwo9CZ5k8xXCX1Dm1jvIWhWI+qmHwJNtuF2jW9QYmZchO+xlw4XLrjgJRuyMRaa
	 BNMrK+Fx0sBF3Y9n0etQ7AEQ4mMoGOG1Wk1EywJjfcoCYGrgxYm1nm/UYjGzPHC5cjkos
	 SOC/S1Im5eYL3EVyEIha9feTm7Z1R7m7ojMefAbNg9dwpAlgqV17UAdGB8AmK8aYJSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812665;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5LUtRpQWJkQjp9wIulBLIg1KkGqyz5UqM5CuRaQJgHM=;
	b=GtYOx844wUS7VivZfc/cf/aI+77seRfKNF5SF7NHu1KKfDN9a4PBNBJHteq4+E/9meI8
	 vkahAqWmvE/cdO9MPN2USnWzLbCuBOTyPL/c8CPcGhMAFqpDQ59I3q2r2vylYwBHL+aMi
	 8TjqEAaAZnWpib56pE1pcNTrI27DNXhCqqBGjOddRhrH6ZiCK6tskKXnDeLix6csIlItA
	 6igfpETJLHPouGs1r/Ey35RfutRBtBSZtxiPBfJLcXNqU8WMwVqXjCkJIKQaDcuePdIsb
	 wa9lyQnVCORDBdrWyDvMxkXh4Opxw3wCxWULZKfDM6bSKDK3VS38CZ30dppAxi8uFfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="eZGqU/8+";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YJ0d9qSP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F63B606A329
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 07:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F63B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eZGqU/8+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YJ0d9qSP
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LVTV1585502
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 07:04:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5LUtRpQWJkQjp9wIulBLIg1KkGqyz5UqM5CuRaQJgHM=; b=eZGqU/8+OWhPYFuD
	ySKZbP30C/XMF2ZitJlxPC4u3cRqLNwbs0oiTdizemAKQjLXw321Bcv8Bd4VGZKw
	yXYWti83SgW7IMpcwN39A6zycURZRxSdw4ToTEntaGwkW/8KZ+kDuSKy9mEOH8Xt
	ySysFGaF9cIeUNxZ3N4DY9A+4fhDFas2dawrVScfBNjozNMTxRMArhqUoKyHFy1X
	sACoPuou1Ehfp6bXHBhifCBR2Z99zC36S6H4DYQ0foytGRoBS0YbzMxfIiEQhsJN
	g/U8B1YJf2vHJzIMQYyfo1fOkAZYITdEq/WNYcQ0m61OkfKI9gzTq5WnqMsZd4aS
	8x+1dQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhdw6h5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 07:04:24 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cddf142187aso611717a12.2
        for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 23:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794812664; x=1795417464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5LUtRpQWJkQjp9wIulBLIg1KkGqyz5UqM5CuRaQJgHM=;
        b=YJ0d9qSP2Zeg/LFjKTfPzs7IYhktn82izo8TeU8lm4LnLmbQ3pNOjbZNrkrat290lk
         ts7S5x8W5P9PXxXmmIaoyiefFbH3rsxG8tZwTWN3sUTWSI9gDn9Mud0Ig71GYa+6ASUj
         TBFYa0rwl7VPkzW8ugAj5x2ridU7c58Ufd6IYWenjmpJ0cmpZK2UCtZq50cISQfZsWux
         GJVJnaWuoVbSHpcBB3GC27/SmPVTZlpJefVgwwBh7v6YX7kja0tHZep9jKkt+aEkHbQ7
         AxIJHzsfi3E/8ybabAhZtXkiCfz3noyP+QHceoVjBZjyRo7Bl2520x+h4LTGBbTFXYMY
         7ssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812664; x=1795417464;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5LUtRpQWJkQjp9wIulBLIg1KkGqyz5UqM5CuRaQJgHM=;
        b=r/UgR4AAp8Wcx3K5cO+OVEaOO1nneJrVVCdn5GMwdfpPKQU2JfBJFG+ltKYqffQQy3
         /uyebk31NYAVGq1eae/pkLM0n5pihths5eDZ2W/WuruMk1ka2ehdHhKNo5gHBu3Auafq
         mDQQz/w+RXOWNWly4ecJuRcvYsmID0wbJuOPI+8FLDNLSKoPL2Ii2K8mrkpXM4pHo7Cd
         7qNHqySRSVKEN6ijtJVE7Fqyc6p6WQsD5uo+Hf3rLyxvbRB7bky/n8k7WePc5mgrNgEM
         4JGGhT8rd3mFUujTvk9UpkyoLt7ErQ0Iy0K07phlaqlJqFR7WGXp4hDhRR6nFY2t0EXV
         uggQ==
X-Forwarded-Encrypted: i=1; AL+hErFW4pg+MJmwnV6YVYejhJv0zJFJ0y11yFMMYQIQGhPuhIj+ZPZ6RrpHFVO05C4BND0Ibqz4opqTG0I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dX4dIjr/A21Jae29tJxtKfFOvkkNKybrh/NGxAhOq9kmhRluL
	yohT57qpqoIh5S+6vfZ5GPkMMCsuOCc63iJ1AHOcBPDQDn0nda8I9vSgR55d3NBapzmfzBCkjnN
	FVrA6c1XnxyGq8cY42jR1K8FEAKm2wnYg+rlPU0swiuO80VPh9SU61T2xITr5bX8=
X-Gm-Gg: AYBFou2112DuZlvrUKH3Bc53cRl1MgKViInvDaNXwysmK5IZyNS97SxJnCEUjYarE4Z
	whuVSZbB+URPAD7+pHXXpABC2ewmYE5MX+XCqzD4OgLLeopxchAP3qJDZbnvZA0D/7mC8LsX5D5
	nxQ8aSyN7+773EPtCjRX17WyCUC+swgK295HemiATgn09C6JcKzjoEzvkYVad5C++rzEILAWcoe
	r7FIeorqiuGEWUCVabScyJw2IHpq3f1FNO/zURdj48xRiZa2s2xuyjQCA1k+PvnrzaJ3Bl3rzpU
	JvW+VpZ/AOpRk6mOPORhEnPwKTNmDI14uX0yU0oH4fVAj7JUJNG97olqKdhen//hwI6nqTayAgP
	VAt+vQhINiKtnw75jiWHQDM0R4RmbMYcb9bMQTnatV8gCM0qZP5vlQirV5bDvyJz852r9UPt5Dz
	4WVA==
X-Received: by 2002:a05:6a21:a10c:b0:3fa:7d10:d1be with SMTP id adf61e73a8af0-3fa7d10dd48mr2731032637.0.1794812663994;
        Sun, 15 Nov 2026 23:04:23 -0800 (PST)
X-Received: by 2002:a05:6a21:a10c:b0:3fa:7d10:d1be with SMTP id adf61e73a8af0-3fa7d10dd48mr2731007637.0.1794812663510;
        Sun, 15 Nov 2026 23:04:23 -0800 (PST)
Received: from [10.217.216.218] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed263b354sm3159661b3a.47.2026.11.15.23.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:04:23 -0800 (PST)
Message-ID: <92001145-02de-4a73-b904-a2e84645ff7a@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 12:34:17 +0530
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 2/2] clk: qcom: Add SM7250 graphics clock
 controller driver
To: patches@brar.si, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261116-gpucc-sm7250-v3-0-df68449f0e36@brar.si>
 <20261116-gpucc-sm7250-v3-2-df68449f0e36@brar.si>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20261116-gpucc-sm7250-v3-2-df68449f0e36@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VOVIDNPX c=1 sm=1 tr=0 ts=6afaaaf8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=tvYaUqEbFtj8o43HNvcA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNyBTYWx0ZWRfX4Q4WtDFkVBHp
 ORAgNHQxAC5VWCYvIDgHqhUYYacwQx1H/ZEyLz9jzlWruq/opL1WtOYvG1Liq1GpJfke2IVdOwQ
 EIJPV+xunfa6bMLP9gvuXVhcOntfQQY=
X-Proofpoint-ORIG-GUID: KQ_QrF-4XZ0Kj7c1E_4eKcw5139Xx7Dj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNyBTYWx0ZWRfX/aytx6nSvccK
 +4hZKfQaeiW8KZBoM9Yjtp2MBuvBikFV0BH5CfYgO1DbvQmuREdIdIU/jHUbWrmXkPXo5z6hM/o
 OF1AzsIx0Qgit3H6lZeVCjNILKNd8Q2lRAUegAf2Rly4QIZBaF2bo8uPoWnZfyUOQOOr5SA7m/b
 dvDZ0AceTCU4qBHInBBm0EJpd/6SnEnVdwF6eEPH2yzrGMJHYFsnts5KC/FqyhSBF5KE+sGbODv
 062G3ocBk0XxNPdFFcnd+ECaZg8Pzh2xOCJM+0/OVLb7Ttjrqu9uvzZDCFRWRWpLJmN5UbXtD4b
 4h+ZeKGWPc/+46fmx2HDEnWTD3LmEq91sqkD0BGaRAQjK8Nz6iBJLobDgTPV4je7xGeRwV4Jm9O
 dyreatRGCAKQmcCReOfYNlsmfIpTyeWa60uCq6MEFeHOACrmGcKNC7O0ETju7P6iBzHvn6OzCpF
 yetCkYuwLrD2uf+Lk4g==
X-Proofpoint-GUID: KQ_QrF-4XZ0Kj7c1E_4eKcw5139Xx7Dj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160027



On 11/16/2026 11:51 AM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> Add a driver for the graphics clock controller of the Qualcomm SM7250
> SoC (Snapdragon 765/765G/768G). It provides the GMU clock and its PLL,
> the GPU CX and GX power domains, and the GPU SMMU vote clock. The layout
> follows the SM8250 driver, since both use a Lucid PLL and the same GMU
> clock setup; the PLL settings, frequency table, register offsets and
> GDSC data come from the downstream driver of the platform.
> 
> Tested on a OnePlus Nord: the controller probes and provides the clocks and
> power domains for the Adreno 620 GPU.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  drivers/clk/qcom/Kconfig        |  10 ++
>  drivers/clk/qcom/Makefile       |   1 +
>  drivers/clk/qcom/gpucc-sm7250.c | 379 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 390 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

