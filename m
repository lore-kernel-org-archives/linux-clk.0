Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601690;
	b=qfn4yT3McvBAxr9N66Yl2KtUn1HaDFztlHZzMxFq5RhivOVInAl9jxVCwa4sxdfk/2Du
	 gJOuZv9K870/zv0J4BJgFiGNlQkEWXGsB0gNbt9GCNYrYK0StfzWhfDRD8ac0/+c2ydr5
	 Da5EGTK2NP/BG0h8TIw+9N2cmpj7JxLH7o//BNR6Llf5vfiluq+1NI6+sb0zPe0sZHWaP
	 4fMZyj/FdGdYHci7bO0QDyEohRUEC9TKjtK5yOC/9SUglDylI8ro6N/eufXw+smk28C4Z
	 g2fYZ0xEXol2sZjhN+Ysx/WeBM8rNyuX7hiJup01ODIN3CBLzsxxS0cYJ8ZyNjPKASA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601690;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jW94fUrEEV4vE96KzZHOt/ckZsK/1E1HYZRarmoNLtw=;
	b=Xmb26G7f1NFklSS+w1+hFqfAvaosh61s6Dlp1vluy1bkSRqyt/bGJm+uoLWFxjFUlMno
	 VQxu9QGZ+lfSUp3PYSQ4X3O60tZ9WKzG0THt21oPU/ax7S1n2/FYZQQOQqiwyoxJbBCVN
	 Q5Hnsb6kMUQYx5FWvwvohWW5M7Gr36VGf4/Z2P8Ho5YbsABjRTpW/sHI5/Sy0T5ojT2mS
	 BT+n9G97w+v5n1pxcq22HZdWQOawMBvX1Ec8/ADL1UgiDWzyr24o+ZYWITPnWKVTeTjQi
	 dpNB0sCrmwW1c+K/wn3tWLKPgN9vJ/akRI7xTpkYDTEg/0pfXJXkWLlA8tY33KZ02eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nb5Sjr7f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L9LncZzT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F33C606A31E
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 16:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F33C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nb5Sjr7f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L9LncZzT
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFTwNK4158360
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 16:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jW94fUrEEV4vE96KzZHOt/ck
	ZsK/1E1HYZRarmoNLtw=; b=Nb5Sjr7fQsdtlMvWGadhbbx3FfICmiY3qZWMQ1LR
	rPC6Nx0aPLTss4+KcMfC18xcR27AjWgk02LiIJzH/fJrNqHSEsfL82yBDe2k4t5l
	Y+wO/oUPaiQiAM1Wd/tU9F9NcwO1iTrOva8UJGlyUPIIqcZnLJIc3vdTBumNBFk+
	IyTrLskYn+Uh+yKv27V+235pxslX3uLVkBB3AQoY6NLW0WLzFMKmzQyOSdR+XLDV
	BOPF0foGU9/rfSc1TkeBaWUx/LjUeMHBZB7PRM0or3Ker6wvujp+z6hYDwLnWeaQ
	X0cUfmdQyhAl9t3WQGG3iDbF72jkEUWbihRHNZ6r5kkr4A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5q8yb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 16:54:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb98809caso171985185a.1
        for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 09:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792601688; x=1793206488; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jW94fUrEEV4vE96KzZHOt/ckZsK/1E1HYZRarmoNLtw=;
        b=L9LncZzT6NA68yXFmbG3QtWg8G7dbfTxZT8nhdjnRUeSqSmCcUkLqQS8g1sMZ1ATS0
         nBFc4auF4YORLBoomGt1unfu1m3rOdD1f7xLlWpN1x6nG393P3JTmx+M5xU2ZIFdq9F2
         OfwG5gun2frbrIm9CxfUKtoguJq3NAZ7TM28YeUzh/gBX5qA4WovBjM2GViDgNb67uN+
         tcw/beAuZ7QuR1hF9A54sDv2SaTOYiqPn3j1bp+iMXv8ZUs/xP9lNkBCO+pLezqmZNo/
         HW6gd1BeoXur1oQx+qXDPDDLDgGw64EftZMHfLCYp1uef92pDcSAgiQA4vhZpHLcibBI
         cMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601688; x=1793206488;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jW94fUrEEV4vE96KzZHOt/ckZsK/1E1HYZRarmoNLtw=;
        b=f8uUK80/Bh5DLIY4vIFE4/PbGx5DpnW0edq79rGSdcWXwqcWIJydnEbM5qjMAOJuiJ
         YnMsDesXhhadpZ/PnitLHDY7FrxiUw9JGtHYYNUhZP+V9QOTc7CMYQMPkWkSp/FxoO7J
         ACfb6ZkSk18t5SRqT0Kv2MWSGHByECYEexKfE+sdkXRi4sWaLHelcxKMusy9LFybh6EE
         IS9SXILiLZLUQpdmym+chmNn5koPY8jIaL2QMledpNKQnXKlVB+zb55MvDatfpLRfr5Z
         UGvFfSnDFQsPlXSQgtaDcRYT6oSLlh5/fQ+EdXn7HzS+0hgwC+GwD7RxOsamkinmJ65h
         7oEQ==
X-Forwarded-Encrypted: i=1; AKwUvBywx0vCR9SiNhRu2xK7ZOufNCOdfoN1S3busCoL7SQ60S4kUPL2R9HNVXBnRH9DfDoF2k7J8ATWLZE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJJUGp1gJHEvP/3WAkLNpRUlV4KsRYyD7Yx/ZN0zwyWMz9bAp7
	xwepHfaA9scQFZ99yvf1MWBAjoTTD6YDplTaS6QNIinux0CyL9YzZssk3jO6OP0RqAyn2n6bEMS
	HNZmqIdQnriCqclJWBKqLCZwwx7fMTc9syORLEmXNGTlNxsnu5V4xGc244K+0WtI=
X-Gm-Gg: AYBFou2VN2ubELOB9EU8aaxMTZ1rhJI+7OwhveKqDBEyai227CoHT1VV7MKeKB7n5eY
	DeXjkpRVLnnmvjBN+HMU4+qGVTCROF86M6TIFYz4TNiGCdnh899MCRuw6YmVqIiN/OpipnU2Iks
	wgRv4NdTZx37QF0cyfRuz51TkRCFxTN0ZJ6Pm3Tfsl2QdqrK7ODbUELpci7S2WmoO4bQrYSPdZi
	6cSWEZ0tvdp0ktCBHGZoBkSWc0GmqGv3OzxWdz7RwsSgtlfi+wBaKcUOGBySgUJ+6wS/VZLZWKq
	KsTjNlFswmdSKCahcVlKOQCKGERt/rZ/1n0FoC+jEF/lW/boket09S4dZB/sQUmHwBdpdiQWdpP
	nJDMQGQQd/tmpFbWbjDPv8m5+Qw290C3Jx3oFkT+LBUUGi2FuflznH1Oyt7743yAe9QP2VoHBjE
	2fw5dheAY6nE5E
X-Received: by 2002:a05:620a:4143:b0:93e:6723:9de8 with SMTP id af79cd13be357-93f57fafdcamr558945785a.59.1792601688060;
        Wed, 21 Oct 2026 09:54:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4143:b0:93e:6723:9de8 with SMTP id af79cd13be357-93f57fafdcamr558939885a.59.1792601687400;
        Wed, 21 Oct 2026 09:54:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f68f1a5sm1127421fa.40.2026.10.21.09.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:54:46 -0700 (PDT)
Date: Wed, 21 Oct 2026 19:54:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] interconnect: icc-clk: support N:1 master-to-slave
 topology
Message-ID: <i6etkqkc4zqoex54v42b3m53eqa2fvphyxglhcljk3wjr5mvit@qeuvxlksfeh3>
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
 <20261007-ipq9650_apss_clk-v1-1-fd4c2b3cbdea@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-ipq9650_apss_clk-v1-1-fd4c2b3cbdea@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NyBTYWx0ZWRfXw0pC/7gfb9rU
 Cwg1jQkJWSMHMKsRAi4U0O76Uyyxqckfr7meT/Mv4D6D5JKMHeUYzuPBcVJzsJJ7P/gG5mht79S
 KjszPFmdodH6pi7f89xPTFNTGmn8Ico=
X-Authority-Analysis: v=2.4 cv=eJaGH3p1 c=1 sm=1 tr=0 ts=6ad8ee58 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=nKfPptvIfco8BJigVBwA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: HUx6H8XaymUhJTzyTY9N17ff4VCfG9HH
X-Proofpoint-ORIG-GUID: HUx6H8XaymUhJTzyTY9N17ff4VCfG9HH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NyBTYWx0ZWRfX3HN+qGV+d3Ig
 D0xzv7yR4DP5h8WRh9KGS4sgCAaBe4PlD3fiqAB0hG0IClKhof2eXCOMOnjT8WshWuTWI4Y4BgC
 6qvDqaw8xGVFXIy8R3kJm5Mmv+Oaf07wgZI6kIEsC6i6IaV2ryymckp2zlaj58HacBGRiaBhXHB
 6cP4NamsvkpTACiUj6n5TVc/LAFHJweB1EbL+4xB2NkYtCZD8vmi1IUMTe8ZJ5WnYVosTMkKE5t
 39OEjoRA8zdPjz/5ia7UNb5RuiuNQzw5+yxCXM+knd/NU9HjZduncP3+eobla563smoLDu7zmpJ
 OB0RSg1OXzGzChRZaYkR+cogmQFlub+7kyEJVzqUjuc/527gY27wjVuSHGFsvH/ht0eiXGrwL//
 ZK/SbmaSZoTnEHlbnPBuUQbUx+KYp5Zra/qxpOTMS03uXLmGejFdU+BVmsjpHfuI/gBPDrOJiBf
 xl2QyjjtfyLf2H9GuJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210067

On Wed, Oct 07, 2026 at 12:20:44PM +0530, Kathiravan Thirumoorthy wrote:
> icc_clk_register() assumes each icc_clk_data entry describes a unique
> master/slave pair and creates both nodes for every entry. When several
> masters share the same slave_id, the shared slave node is created and
> added again on each later entry. icc_node_create() returns the existing
> node, so icc_node_add() hits WARN_ON(node->provider):
> 
>   WARNING: drivers/interconnect/core.c:1103 at icc_node_add+0x10c/0x120
>   Call trace:
>    icc_node_add+0x10c/0x120 (P)
>    icc_clk_register+0x1a4/0x214
>    devm_icc_clk_register+0x18/0x80
>    qcom_cc_really_probe+0x4c8/0x514
>    apss_ipq9650_probe+0xc0/0x108
> 
> This topology is needed on IPQ9650, where the silver and gold CPU
> clusters both vote on the single L3 clock through a shared SLAVE_L3
> node.

If you have a single L3 clock, why do you need multiple masters? Can't
each cluster get its own handle of same path and let icc core aggregate
those? You might need to have a different voting mechanism (i.e. vote on
the sum of bandwidths instead of voting on the max).

> The onecell table is also filled in registration order, so xlate only
> works when the node IDs happen to match that order. Size the table by
> the highest node ID, index it by ID, and skip slave creation when the
> node is already registered.
> 
> icc_clk_set() also passes only the requesting node's bandwidth to
> clk_set_rate(), so the last writer wins. A low vote from one master can
> then lower the clock below what another master asked for. Before setting
> the rate, take the highest peak bandwidth across all nodes that share
> the clock.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/interconnect/icc-clk.c | 45 +++++++++++++++++++++++++++++++++++-------
>  1 file changed, 38 insertions(+), 7 deletions(-)

-- 
With best wishes
Dmitry
