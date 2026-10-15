Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B929C51475A
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 10:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059664; cv=none; b=P5jdRRI6J95I1KqmC9zFi8ubm6rOMFjqMmurBhwBPL+SYlinzX63n4Q3bIx9t820x53KOhwZGURnYozdgGiUAYfor9Z3GQgtfelXEQh8rR7o4PP0Dvyo2130PK3fg0154CPvUQqfRDmgng9VMGlhaZXl24kuTh7dLfNMBSA4NTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059664; c=relaxed/simple;
	bh=u5tlsWRinm9tCneuBQHtmvAy2x7uMN4jqyTkfs7VmyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NGsnyMRtj/T9HODauTnUqsHHALYTGpswozsUH48Fm3Ae6YP5CbhwPOCjeF8mgV86Hyu5fV8AVJQdGHSsfN5f4wGFJ6W8i3vAH1UreCDg2tOzHjmaHmT3hkiVvGfllVy01rqSaOHu/QcHM9UJVht6xebNUi64h/KMJtXpXdfMXuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PXwPD6H9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GLJtSuGC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PXwPD6H9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GLJtSuGC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kGnm2999177
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 10:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eo6z2wfe8BTrExVINJs5EqIKn2ZoTlfrPsINE3NUuCs=; b=PXwPD6H9VVWAPlpm
	7e64/gahPRzF03ivU0ke3Tro/pwygWZG4HHz/Q1f02i2TNYa1FbWmc6YWhhs6zJA
	WBvr3r9A12RcT4cqpmuZl1XpCTUNyxL8nCdFyQ/KSm9cw6DOlI37Voz1g9oF0RRG
	Pww5TMpaykPDJlt6boMjRlO5IhQwo4WxHDPepaudsgyIutUptE8Xmn43EDbjzspp
	Th9BcXQ3PIWKEuLSBfHhF9uo0a4VVpGR4Ff9K+hW654DzNNd3ejPGOAqV62XoB4n
	nITbNg4KhiyjXVzT6ya9FePZLUAwjC+BLrfRvPiinIlka3bXhyEBxXqPq8RkvARB
	eKI/kA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hausm0def-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 10:21:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91795e52969so13105756d6.3
        for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 03:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792059662; x=1792664462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eo6z2wfe8BTrExVINJs5EqIKn2ZoTlfrPsINE3NUuCs=;
        b=GLJtSuGCnp2kCwnyCQzxHvTH/k7snfa0wi5SVyWgJgdi4sxYim1fMsL+flIqokQ8/e
         xzX1n6SNbTjSEjz/LALdITIY7q9qEhojMIOSN5Y1kU+SjpBevFktwMZAoIAxVWgdk/Kb
         p3hRydXRLiPjbhliERQP3Smo14b0yMKPj/oI0ZoJg18SbtFZreCvsw0r/5OlnmQnJshg
         fww7xR9KSeJEoMM9wujQBAivpuNP2S1K7vAg2/U2OI713FNeajMwE8gVvnG+jlBN54SE
         QH5/l5GO11aKZoWLZnow2yQ4aGNRDFvgvXRtg0VF5M6lPtz+sTZnGIf+caYw6dIh64D2
         Dz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059662; x=1792664462;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eo6z2wfe8BTrExVINJs5EqIKn2ZoTlfrPsINE3NUuCs=;
        b=CfuxwlkmsqoubRXvrV0JUASIzZwUzlqeyuBfn9H+pQr4hpIVJqVz3t7tZGSFF/OWkY
         eNayIxdDbm2Y/b6oJsmSt0zZDouC9vW4+d0iX2eOxA4/Sp2VNX3CTovLOc6Sv53zdt8/
         SVrqlk66iuItdDAC1DubRodBw5XTAsPaZtZxYCA4Tiw7cjI2NZW/pAVHhAzvZHdXEN8a
         Uip0aF25ePfhnr30Q696aKeH2apIH8aHaq/s/cTFatXii5r8XtktdphY3dFWNoD89IGr
         Gn4F7jvXS1UoRzxKOQ08sqorqLrmsw5DQDjdhplFg3d8QkJOUBLRzPagDrXVk+DEryOt
         qcXw==
X-Forwarded-Encrypted: i=1; AKwUvBzV0YEO3gWrQFD1EX7v4pi7pZxOaZpNf0KKFFSICOcu3yEFEnYM0ergXHH+Q3iVovi9Ze6pGpK4BPU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9hkENlYU9WVA3+B734M/fHFSAJnGCf+9PverW6N1oIx/ZEZXZ
	DJFEpcwBiem5EOqTBhdohAiXZ25ziWyT8WJ6I5BxYVR6b60Foc2DXm/TPwc/Gy5vp52WH0vpdfD
	6r0uOXMg1ukK+/fGsFZ94HPSoKQWY6vthqYtbkxgnnciE17adjzBxK+3xuygxlW4=
X-Gm-Gg: AYBFou0rxMbjzIr0DsBklMRJ9ypMkz0fZOeXb22IMLQ/kNjbP/yNtBjCCzegbHWjfQx
	DNrJn6u6HqXwk5h4MSDNhDvS6i4426rDTzVXPIq6AXrCaCimM1iWFMrHaIqoNV42rEs+vBMT815
	q3FFYPo3Qi1UBOqpE5JgNkqgYuk6tw0996dZlvzpuv4Z2mxf3bvg80PdwbNNTa+KpyffHcS+Wn3
	/i3QYctZw5JT7pYshIYt81M7a0weEX4kZjqSOAMySGOkBBJ89FxvUcFn/O4cQtqQs7dax2FZ50R
	n5MQm7V2cJHeZCJ0U9UNJPuFJ7hmhAb1O1tgm3W5bd0psdRnOL7JVNHn59kZegXCtqT6cYIkhBl
	P3SDwWKAatWyPUQOHuJyAsQ==
X-Received: by 2002:a05:620a:27d6:b0:92e:6485:f640 with SMTP id af79cd13be357-93ebd224118mr3302251285a.4.1792059661891;
        Thu, 15 Oct 2026 03:21:01 -0700 (PDT)
X-Received: by 2002:a05:620a:27d6:b0:92e:6485:f640 with SMTP id af79cd13be357-93ebd224118mr3302246985a.4.1792059661402;
        Thu, 15 Oct 2026 03:21:01 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda622246sm105704266b.70.2026.10.15.03.20.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:21:00 -0700 (PDT)
Message-ID: <9d752fbf-8b8a-49ab-8e8f-5c11963cec71@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:20:55 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sm8750: Fix videocc clock inputs
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
 <20261008081036.3492003-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261008081036.3492003-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: idMTdgldWyIWhHZXtlHmIUIJ1Sljc9XD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfX3Xfm/wM9NUhf
 vAmGe1xzD3tOsjeQxWebE+wS/XKZptzHx6ID5cgAgCpb05kSsfNBydwIKqS9dQzfNDr0VxwwUNQ
 GumjdFKO+YBlNbnQC5HUwcQYamluRUfMDNeYt73FKvXBRcPwBIhYYLKKx0k2DSeDbpaJObOy5qV
 h3Ss9Jj4zyVKoZf9BPx9fSSHXA7rINJ5shm9yXir1VUIf+SWQZhcIgM7v3+cqUHr7GfYL/qMZ0o
 ugk3d4rbilb5Cy34M4UTTP4dl3T1UOBD2SNuQSVmzOXrA3nehY3TSrDSPJlM1VwQEYYeZmcksdQ
 q2aOlEnJ4CL/pmKrp1ksiwBvsptiKBMqLyrwSNx+gP3RIRJt/Fk8Jr5coR2KpyASM2YEIsRwiJy
 MVcazVGSYLCIcVawwsGsxiInUimDJN2TB9moS9HMMPr2Gsu+3byPlfCUfP/4SyPOBK8yj0AXDnY
 c2SpPktEPNGvINij+lQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfX3cKkqMTe3AVd
 xfueFfyl/Yl+GzVUhAztuHkY4YqSRVIu1x5k1BXhgBvDNNGueiEVIYsjcmco7+yycK8Gfls5Wm+
 kuWxl9pJP53SiBp9mCkFeV/QKu0nnsw=
X-Authority-Analysis: v=2.4 cv=Eb5d0/mC c=1 sm=1 tr=0 ts=6ad0a90e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Z62H7OANAOBda0uacUIA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: idMTdgldWyIWhHZXtlHmIUIJ1Sljc9XD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150041

On 10/8/26 10:10 AM, Shawn Guo wrote:
> The video clock controller binding describes three clock inputs for
> SM8750: the board XO, the always-on board XO and the 32 kHz sleep clock.
> The videocc node instead passes the board XO and GCC_VIDEO_AHB_CLK,
> which is not an input of the controller.
> 
> Pass bi_tcxo_ao_div2 and the board sleep clock in place of the AHB
> clock. No functional change, GCC_VIDEO_AHB_CLK is enabled independently
> of this node.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
