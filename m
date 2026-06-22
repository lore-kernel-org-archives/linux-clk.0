Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB382DF142
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 13:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782135249; cv=none; b=s4Z5DW7Vw7ryBaVnvtMalmhM76Zk7u1VILqgYeHmBjhVs82ctp+ApopBU/hyhO+13EwtO28K6ogfvADwpwaTfdFdJ5YynW/+JEIB8gQLZpQ4KHn+Delnrkz694LPOE4LbgS6yTQOIVyFovmBk628wDtaCd11ghDmDYSwCPs+isY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782135249; c=relaxed/simple;
	bh=xpM1ZEUR722AzMER/5vxKpdKmElmxGBgeGFi7LDxvpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uIMhVJyf0PWKQcgWB2MjTejucx0PAyMPL/hdx/6h2TynCLj9GkwXNye/9Y1ZKMsiF0wHPiBU6dbmWbE9ksREEtvapTpdJglGxi9iIgWqK3KGLCCFp7F1Sz2p9y+BzfZuqPaEJCjJwRhSHg8U7xzJkHYud+mlKyt/x2HjHG+WXYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KRstV2Ug; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xb93aSH5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KRstV2Ug";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xb93aSH5"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDFra4718926
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 13:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P0f5BPDdIj7CppYyldUI6Otm
	CaI6kqghntkZ903ClG8=; b=KRstV2UgewjURqh7bsdXbZNF+7uBIHD/LruI4miH
	usE5G0aKqP+KOU64+hmQDZUARXVQ7vzfEsThQ2b9ZxR/+tXhusjauBwuAikhyHBz
	BMBuQG3yUAye6vOYpdVZ1E9u8/Cus8e7Uxtu+wrnzOwDyHJNdv6zWzeHtWUmSEu7
	YkegMMLgSpoHOiSU0KxgcHxbr4JXFeVZkRze5eHHo05WzAGl4PO4GAVMwNJy1Da0
	QRkA40E2xUTTlG3/rj7n5wkkcZe7xCU5HAEB6ehRAIapgWHhOm7XYEv3aesHqtXz
	F+kn/CoHbPgGz63EUfF/hQRCkvbA8FvMQZGp7eF08dkF5g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewm1k6h5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 13:34:06 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c17bc96afso1842471eec.0
        for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 06:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782135246; x=1782740046; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P0f5BPDdIj7CppYyldUI6OtmCaI6kqghntkZ903ClG8=;
        b=Xb93aSH520vG4uc5J+yjugHct3rxOVo5+888bkvlqo+NXnAoD/g0xqIIY9VajTWBJy
         GD93+R/cc2DgQ8XYTVTpHqMr8SFLmsVgCeXxo+OCzU4SS/oUHZGc82Ry03OGl+jqL+Xk
         WynWKSjK/00U2EdMpmgi3703A+X7Vb5bk8i4hA/woIyIHsuuylKkrsTnJxCjmE5zD7XG
         CzOLfrnRXHESp1AgXp82T6wB2+Hj00y34pkLdaAdzIx942+zb5e8mIcV9sTD9cbNNBQC
         yb0yY8rzjy1TDUdkCIndAvNYfSdYYt0h6WuhNfRVf3CbYdCrWbFWepdVCn0/lS2wwqRW
         /YRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782135246; x=1782740046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0f5BPDdIj7CppYyldUI6OtmCaI6kqghntkZ903ClG8=;
        b=TfMSSewHtg0oGbNOXD605kgw4hJXZNJ156SHr2/fUC2nryY/9qWJa9NTPWUsqM1XFI
         EZ49WQAhjMwnWeytiZ34qK01ZFKg98bRV+D0Kf7RDypH35hBitB24z43UwoTv8Y99QOs
         MGrDRvGCwPSFXLoCvGjRMKlI0Lk1psTXqWEY1BXCFbdynlOUcnoo9ZUbq3K8Z0ckALuS
         Y4jaVsrYxziKYlbFwYjD81fJXnKRpqh1lsP9h5rk1x2zOHwso1JQBNHVuMGCr5MN0uSi
         qXZxfFPh9RW1d6/tQCFLL4jwi3/jTHndOYLxmM0SNVHiRPSM4HQy9BzWilI7IhawPSSk
         nQ+Q==
X-Forwarded-Encrypted: i=1; AHgh+RpafWR+dbQrObyBA43sVk78hclSrkEhm+P9D4uROV5U56lJVp4OwWnJK05rnn3H5bQmBiZvMFG/h0g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ+l1xDdXrgeGpYHFIYH/DgsBF0CEwKJugqUEaMuYY2BPVNZr7
	pUdKEtffRK0BMaQ/vcAUqvUYsYhwV/0o0+uGaXqYUNUmD1Y/aFU1MQMy7Nhw/QP95iYyGNDUDuL
	y0y2slu/hqtpKezLzIPPvzS0VQYCqVOMdS0LolreyoOEO2m23gwbAw1xzTS7RueM=
X-Gm-Gg: AfdE7clht1JArxNmkhgZfdhtNikp+7joWlWMeXCAki9s8AxL2P0QB61h6FhDxMKo0/b
	sArQBvtb4SQa9PCN8mTw9eJJkFOTsA36eTaD9ssralgzi99xdAL3s6InBteIpKXCkENwP1hanLh
	HpQEGk/a37y98LfY96EVo87Hzpob+COLZ+PfFmMlg99fnlmjyh3r9nq9ipI3LI4o2ajnKIY7E+h
	UhXJ6z6Dfu1Yw4SY/ibccAETmC5RsIXKMJx4NG7IVWbpT33Sk5zc1CLKqF+yVPzHUtnWcaaGl05
	JQCOvNSfuRfQgBhuzjSo0jx3djh+HEZPtnWZ2dDGD8398UvgmbOkxp85LHw1D5IQDhJTS5d9o/W
	F282OmdrjjC7+KfgHVQKWMctwqGqdI6DCG8I+nX+iEYd9wdw+BkrdMAK35g==
X-Received: by 2002:a05:7300:5b95:b0:30b:f477:6619 with SMTP id 5a478bee46e88-30c0cfefd60mr10546741eec.15.1782135245768;
        Mon, 22 Jun 2026 06:34:05 -0700 (PDT)
X-Received: by 2002:a05:7300:5b95:b0:30b:f477:6619 with SMTP id 5a478bee46e88-30c0cfefd60mr10546718eec.15.1782135245185;
        Mon, 22 Jun 2026 06:34:05 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bdffa83sm12707995eec.23.2026.06.22.06.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 06:34:04 -0700 (PDT)
Date: Mon, 22 Jun 2026 06:34:02 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v6 8/8] arm64: dts: qcom: mahua: Switch pcie5_phy ref
 clock to RPMH_CXO_CLK
Message-ID: <ajk5yq5F9pri6sKf@hu-qianyu-lv.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-8-c939c22ded0c@oss.qualcomm.com>
 <a9506482-aa46-40b9-830b-afc259f9e47e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9506482-aa46-40b9-830b-afc259f9e47e@oss.qualcomm.com>
X-Proofpoint-GUID: pDNu4vTR7w_JhyZm8uki1IYZIT0-f9uD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEzNCBTYWx0ZWRfX58BAU9IiU2KX
 o8rrSFUNi3xO3LwWuuXavoZPccNfd5v57vrgIvBFCt+E7YV/zxaUKAXNOmWUiBFv/6TlHMc4DXm
 oE50BqVAqQpsJtggIP3K7iq1xiMw5g8=
X-Authority-Analysis: v=2.4 cv=T6S8ifKQ c=1 sm=1 tr=0 ts=6a3939ce cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=FiaomCJZojttUmy_5dEA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEzNCBTYWx0ZWRfX9Hj9+BaEosC5
 6hXoWX4AbXKYSd99OHbMfqhI4sfkq+2JoNLUlxwdcd6RMV0Blh6VyRItZWsM279dsrhEdCUjK3v
 dCXS+1mrkvztbBPNCSyQenzuEgJet5Pz6v/A7slnU9e6LWtabH//62hUU1FDfE1odCLpKsn5pRj
 MY6cplJedgxoaTbUo0tt3Ar1YEBvvqwywvJcVyUMP7+LZfYdmnMYEl3if64e4XUEB/FQPsdwB9a
 RGIMLsygPYmQnvD5cb0SUIRotxdkV9CUoQFxYQ34+vwD0t+9+kqSoQK81bdJvqkZULXSxdNwW7I
 2W/0vqMhIkIq7PfP/7p4cLq/JLoF1fmLzRyxKm5QDi/b/7SCMM1L4NuBkk1Shh99IJNIP8n1H6X
 FddaFa2ARheBleukKYzzrR4mbE6rcrKkKe7PCMn+SPrY2Eg92/QX1nzlr+/N2eOpxCCDjIOmio0
 ip9US4pfIxln/tQqVwQ==
X-Proofpoint-ORIG-GUID: pDNu4vTR7w_JhyZm8uki1IYZIT0-f9uD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220134

On Mon, Jun 22, 2026 at 01:37:06PM +0200, Konrad Dybcio wrote:
> On 6/22/26 7:11 AM, Qiang Yu wrote:
> > PCIe5 PHY on Mahua gets refclk from CXO0 pad directly, so no QREF
> > clkref_en voting is required. Override the clock list to use RPMH_CXO_CLK
> > directly instead.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> 
> This must be squashed with patch 7, otherwise PCIe won't probe on
> Mahua
>
Okay, will squash it with patch 7 in next version.

- Qiang Yu
