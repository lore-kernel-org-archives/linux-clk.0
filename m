Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556992;
	b=tb/4OmoyfXKlAC4kqTPzOOpZAkKW9/4DlA3K2hmdnFNMfbGSaF16BraK5DMc4cdx6PNJ
	 bGzbTTPYU06h0s1Qv16kbXE/0LWmEhs3yOTETOjNv6ED5IsXkkg3xhrh6qQYf0GTqv4Tv
	 oLO/baCQjNqAEgklU7JGwI3+vq4E6cjDUhGTWQeO0Oz+XOAPy9ynOp86fe0ULdAVnMtp8
	 ntDK+RwGtBOmRJh7Gc1mZKyvUmx7U7KvUdrlrFxaGCWBR/GjqbNuon1f6BGBcjYoPQBW8
	 Qup6tLcyS4UkBE/la+/lyZ3JNfAEmEDPWCUOYBLGaZSfzYAKi6P8KjiwXdmz8JVXuFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556992;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zVzEyTZk+1HeWp1LRvu76rixuMIXyO9jzfzAeGraCds=;
	b=YWJj+6FIKtwDfZ/iOl+233MsnW/r61nlpOGew8w8oilXFj00rtThNo6GFhybF8z3T1kS
	 9hIMi5eDOcmo83S+bUkO9fRZGaGGx1pAsV6t/K4pDSonePQkNy7XpbBmyzRRGEwmd7kQH
	 ZY3seO1dBzrvrxC5DcXMar02S6Zx1WMgSPMLk7/seaWmvVmaJPWDb7sv8WOxstH4qN2K5
	 814oA5xC1rTAtPbQjt9PC1MU9cswAteOMfQmm58eDPRbn4yR0IGlXAs3mAM5kx8GPDlWZ
	 4ij8TQlrpHF6OlRxkgewY7QWuSxsgUYcPKP/jT+r7PS90D26ToerMsTAHFtuz/omA0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Oy4vo9zS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EriXx1d4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA013606A331
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 08:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA013606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Oy4vo9zS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EriXx1d4
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD56wtG2618536
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 08:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zVzEyTZk+1HeWp1LRvu76rixuMIXyO9jzfzAeGraCds=; b=Oy4vo9zSfXOnTriV
	FVhy+t9/cBbMbZiP9Mhymkf+ac0TsPPXlAAXr62o2Igb7Ls2H8fJLUvazYafDGjd
	i7o4tG2yusJN/vwcR+jKWVM+KReKmtRbtB8R5/9fD9URbEUSruSXvT50TZUUCK7g
	vXkbyjuslOwYOwscZl97TgTTAm6+0cwyyXGAdMD5tp/AzrwZasMG+OQVGl5zUbV7
	E4JgYY69T200s8axZA11tJwEMKNQcbggyldDwZuzeFyqJEsgCW1HNLMujqDcuHgA
	WwqcO709jr0CH17N/OJi5vEAXOpoiywNdey7lP4Sok9XYsnEMz+05yFN9UKzyg+K
	ef28vQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2mrta0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 08:03:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso20976785a.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 00:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794556990; x=1795161790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zVzEyTZk+1HeWp1LRvu76rixuMIXyO9jzfzAeGraCds=;
        b=EriXx1d4uN9we6P4Nk/oR7djMWkTEblwJH3AYRtHXrmjlloyAOH23+V72vD20vIR6M
         0vhZJJB2Kqb1fVSeYxiVAYR5B0Wo5vXWw9R30A7hq0P+wIPvzKrmcOoGHa59Z3Co86XG
         nxqKH2POQ535lHIkL1bUEB7tCvh2ZSiDdMmrqP659HX8uLrfm/Oovp3iad/2n2eN8ZIu
         rzPJauERCOE58BcSa9ut8mCmCelmTmL6TV5KMTHd6ivqinF1TUBeyBUCZgmALACOIvMc
         hbFKXsXk9AlkS776qSMmmdxt3SYBRhtT7GgmW1GftGvb326JoGuXqj5XozXRH9YFqE+t
         3RYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556990; x=1795161790;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zVzEyTZk+1HeWp1LRvu76rixuMIXyO9jzfzAeGraCds=;
        b=YoXpm7qv5OFkjAOiofUITfdkzV0oi7Z3s1Ek6L4NId9rlZFoSted8ILc+sfE/ShM76
         mIE02dQHG5bnk6je40JwlOtqeks2MzISrbY3Dx1zyKN/QpHnJsjgoFRv6OP25NAHunXz
         n6tOPw822j56RObDRDQF6cxIwKo9OxGe73+z88ZR9sHHq+rhJwTulyKakWrc5Yd9NKdy
         PGe5fiP1I3ySUTxUKkhcs72ZbN5EzCkavzTzcz4svUDi3s0p8dQEgekYx/feyG5FU+WN
         LEWx/dKN6+bDKKxbo3sOWZaNnxt4ECPqAiMl4805Nnhmca6nue9sLgLQLLMWwTqV7KpY
         0s6A==
X-Forwarded-Encrypted: i=1; AL+hErGNjaaHdgqup9/TUMCnmvRD0yO8mNyuq38JlKKAON2WNFHVNmP31kIVO/ZqtCxFj3hCrFCK2xGkBQk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Hqe1h4I98ZKkmdRGLjVjPLyH2N/Y+UNszL0TYNa4iXXeXjaUN
	m++cZQUDpcOjSdDnbbcRXgkDOKMTTgpfrNDCMoWwlrmKc32Xbkc7RVPX6CPLCAa95rXYaAVcuIg
	mnu04/RV/WFlIKi7fWjEGqGGHcbWDaakzYAXInCJ0bzfWWPqrje/zSsxausJ/Mtw=
X-Gm-Gg: AYBFou1+z+wBfTt0mxKojX5TsllZeNsqJLgNFFENuzUQtRq0wy2Pw0u3l5vj7WC/vJl
	0ewnh0k0IMeDWk63IDTZU5d0zr4rzCGKX0WOnibfLQhPzK7fq5V5euemLL5iYm1HK1guoZMO9J4
	tfD1i29jc8p7c5BzcgA7rV484lQRgX0Yz+DwiBE4L8ZEj8+X2h82nZIvLAwH1unUJMTc9g8GFyt
	wbK3KZi8QqKeVOkVIdHJANsPd4r4OS/UPXV+bR6AgxoyscUr33hjFUxTbxEGvJowMDkE3eWTydG
	RDplYRxTDG/R+0a/iM8eil4dCThSs08zvfpHiXaP+xpblvksS6UcGCghV4JTvbU6e+7Rxsm073O
	lL/2yYV+wUA03mzF50wy/KbFIksfofDdcbDaDukB+oRw5AVe12/B2gj0VUy+fTj0t7dRQqL8=
X-Received: by 2002:a05:620a:a790:10b0:93e:6d87:4f69 with SMTP id af79cd13be357-9494bbc8d7dmr268107685a.3.1794556990263;
        Fri, 13 Nov 2026 00:03:10 -0800 (PST)
X-Received: by 2002:a05:620a:a790:10b0:93e:6d87:4f69 with SMTP id af79cd13be357-9494bbc8d7dmr268098985a.3.1794556989293;
        Fri, 13 Nov 2026 00:03:09 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7e5cfsm63171966b.76.2026.11.13.00.03.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 00:03:08 -0800 (PST)
Message-ID: <ff19f124-ccb1-4f17-b047-da01d839bd36@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 09:03:07 +0100
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
Subject: Re: [PATCH] clk: qcom: hawi: Constify known static data
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261112154357.271072-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261112154357.271072-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: h9x7-F3OqRyvpA-HDgA8pHDYMQbh342b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfX36LabO7wTpam
 QV7QIk4/IXvQLSsn4tFhxl0AAn7LYqFBSvjmU3DiNcLvKD7Rney+7dIqwurYreYQP1GNfR/3WT8
 N7vzMdvEC652biZZu32NLYxXhQ3ax6u59cxPF67ZyGoYVx8iR44yUKakW12tW6XwjDuDgn9BpEC
 lRAR2s4PkbqlPYDlLehte9GcdnyYWMwY5W/ZfPyeJPLT/sNtubjzYufK/W2dRVrTkqDIZV9lzun
 J+AEgbpW3qlZ5eHLtpTrn5uu7Q7QJG8Go9iVDqPGyVsTEoH1FGj1XkxJXZ3u9tAuiT3bgzeIoMA
 RS9kmcVXYqeyfKXrNJx0M0+OqmDhG+VIeJbS5/H/fiZ1rcLZjkUzGKhtMhG9Z9ikOfL92lQdzmS
 cRTT/F1OHPN0kKpbK1dsdytzBz/VW9Tp/djcaC/950gYtRtwoU00MRrksgI04hsrIKhmxHo0hJN
 azI8o0Yubd06D1rAtWA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfX/Lq0VyZQc4zX
 cM/Q++bnmccSlNZsGiHW04q/oL/r50SJMvenfgbEbCRNswvJ0vYZnF6ZrkGd5yyw53i0D+1IiuC
 68E+DMY2ndPE4uxjIUCRyGfDTtJALfg=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af6c43f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=yez1amU5zvzsZwMJzWkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: h9x7-F3OqRyvpA-HDgA8pHDYMQbh342b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130031

On 11/12/26 4:43 PM, Krzysztof Kozlowski wrote:
> The static 'struct qcom_cc_driver_data' and array 'xxx_critical_cbcrs'
> are already treated by common.c code as pointers to const, so constify
> few remaining pieces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
