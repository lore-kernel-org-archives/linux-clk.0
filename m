Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9D935E930
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 03:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786679713; cv=none; b=dbatHuJhIcfjR/lBqJExM0O1Xenfz+gT/dq6jSWbwcI1Gf81T3RVngkjU/RuB+1a4OhDyayyc9QtrWR0msY9rcjiFfqe/2F51rt7W++8dKdSTyiPLoAuDHfsacZiZEBJe5ppgNEoNiZ7uR/096ysWDjFhs0SG9eip8bWK6lO5os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786679713; c=relaxed/simple;
	bh=o4ccvS06V2MhTeY331ntvlGHTRj2o8ia2jNaCP4OBzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=omNRY482eJrlp1eJtdnSAk86gmNw7j7R8FYVNKlWOCDlhJZHp+OhaO7w6VAwRel36jJArVWI6tPSTji6772iJWscjRb6isNjvBfWIDFxed9vsMEyyROhcTWoRETcTClnYBAzNxqwHlDUSJGJq3xElPxAPq9v6+eJ4nhPrSWnuBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m2+DFHMu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QSRx8ahS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m2+DFHMu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QSRx8ahS"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E19hIL748658
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 03:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yPIzUBfzGTz6jZ+0zEOwyurU
	D5i0511kS2C5l61RL/U=; b=m2+DFHMuVs2QMuQEjm/vYW2BNWgJdRRYtN2tsljI
	3cXb7jqm4YPmyIxzhNBuvUJz2gq2rRbn2zkTwOPDT4kJwRNknRu2vlfgNUpNXJQP
	FNXmRVGImhf/tQp+6E4vLzQhKcgTYZ4KQIcaIcVFEqpm4Boa6d0eEPU986+bl98Z
	xljXnmTGBa9RdZz0B3dl16YzPZlITSz9Rr/n4vtV8y1spDKvnymzLzLiub0KKwvi
	a8Ys5yHpEC6JK3GyCQRZXVjnd2L68wtI+Rg6DWFrQQ8sy5T8WO9am8lB09mvn1Ow
	JIs+9qLpJMcnL/6+VzFAIwwOR/AJfiOXlR2CXs2msj0DyQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1nugs258-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 03:55:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cccfa32670so6691025ad.2
        for <linux-clk@vger.kernel.org>; Thu, 13 Aug 2026 20:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786679710; x=1787284510; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yPIzUBfzGTz6jZ+0zEOwyurUD5i0511kS2C5l61RL/U=;
        b=QSRx8ahSAN7zw8X6bVcPAyapU+l5hmVbYQKJPXhFGUwk+QsX6nco05MHt1hS/sdead
         3Kccq7wzilzJAif3H2TNVKyMn7CwNZ5xQAxGshF7iPe+kTPHM6+5yOPJ+uQHTZ3Qn58r
         EGVtMmB4Ur7RzUCo6ZlHp0rhWu2uF9WkGU8Ki/6dcnPxagCFIdcn8vNnU8ROgCJgFxTH
         S7Lrhj9xBbimt3eneUIxTWWdvdG2sV/gSMAsgWmzenWPN6Fs8xStCEuEnvgt5lAw9f6e
         HRBcZUkoZLnNVxog6bV/Q9VPCJchuNJjjW/VAbt6Hyaj3pUVara+6BE1wV17zSYnVAcP
         RlHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786679710; x=1787284510;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yPIzUBfzGTz6jZ+0zEOwyurUD5i0511kS2C5l61RL/U=;
        b=EOjIuuQZiVSXwqeqnB7oDuNminT37GwFWh6xNp6ofYT1TKMAKIa/SC4zIzppXszr5m
         AMyqC2CqBoT2mGgioW2ZPKMTRPrgGYmMUPeftPtTFUjhuwPlunnMd5HjC+GNMkZL52ga
         NlzmnSCvUP/UvLYDuHWXkk2qfkcRX6ToBGwkYx2imb9AXFz/fed02n78UdkQtcnMZQv6
         VuHdUZ7o3LF2rxqloklrdyQWv0ilh7bAUcux9NsaiVl7LkxSy38FlkSV32wlnn4oQIuY
         a4A2KBVxeNixmrhaJQIBDXelyeM5JLPIxmAz7ioK0hvUx7JEz0h9Afp5a5Dbm8djOvqt
         Dxjg==
X-Forwarded-Encrypted: i=1; AHgh+Rpa3UJJYzS+AuA6+StHDiFlqtUdA/E4gM/t/zXwYU6I+iN7zdUdC6a0OJc768KCvIK9NiGAuon7kwg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCPyLkeVdQEmpIDX++B44E0LqubnkAg/8m0d8JYfrla5rvWi4q
	laC/OygUBIAMpD65eqhaUYP4HheNAKxfyTJHHWM40+v1oIWLpmmkIB3UkvBi/OF+D30q+QT1PJq
	/+fGsCnQJomRQ/a2pZpPSCjRbKx4ls2rFRzP65RJd6Fe9ZcCgHg1OsTBhTK49AGg=
X-Gm-Gg: AR+sD10c/a9fvCfG5wUNgYBvrvFm9voHL6MgeDzQ+vS8z7///xSS2syvSWySg+k2bvP
	vMULcI4kEu80Vq/3FpbpQUooFrsnLlkDoWBsTSQyrpT56TcXbHznXZJzI5/r7TBaxeVRjTddKKt
	nfkvwDW5osdaSJCnI10GXnTJxuma4ZtWDm20SEWzZPInhmhszs/rlZALj4lpeWYNyoWC8jd/lL+
	ophx3sXwtDXKYbnG4DmdLpf9sJEhvPo8MtzcBfUhw2pMWGSOspC8XMUP3uieM1U4E1e1Cr9f4VW
	R/1RlG83ftm11dHxzRSx8WMkCjsxDZmN8NE+968pjPJ+Mo4oILWZ7aRZXYmLYA7MK5WM10u4Gni
	muHrNCYXmKkvSSeV9KSnAkkNeXGk2QZmunrgaqBIxsMdbDI0=
X-Received: by 2002:a17:902:f786:b0:2cf:a108:7605 with SMTP id d9443c01a7336-2d3b0eec68fmr33027725ad.11.1786679710585;
        Thu, 13 Aug 2026 20:55:10 -0700 (PDT)
X-Received: by 2002:a17:902:f786:b0:2cf:a108:7605 with SMTP id d9443c01a7336-2d3b0eec68fmr33027225ad.11.1786679710060;
        Thu, 13 Aug 2026 20:55:10 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc39de5sm13076707eec.22.2026.08.13.20.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 20:55:09 -0700 (PDT)
Date: Thu, 13 Aug 2026 20:55:07 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom: Move x1e80100 TCSR to
 own binding
Message-ID: <an6Rm1Mkpo0cHfgc@hu-qianyu-lv.qualcomm.com>
References: <20260812-hamoa_tcsr_qref_0812-v3-0-dc7627169c6d@oss.qualcomm.com>
 <20260812-hamoa_tcsr_qref_0812-v3-1-dc7627169c6d@oss.qualcomm.com>
 <20260812-lively-determined-loon-31f65e@quoll>
 <an1qXeZoTdzrXqVx@hu-qianyu-lv.qualcomm.com>
 <323c7e9b-0ee4-42e8-bd15-b64c61723130@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <323c7e9b-0ee4-42e8-bd15-b64c61723130@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDAyOCBTYWx0ZWRfX4WkEKYnMN4Ow
 LC31KmgK5ZxAcmzi0mp1VTbdFakz8p2ZsGwTUxPYyK+wlbI/EXt5YHFFanzOVkXlEf3exHmGW5R
 i0c7/uCAuTek1TD9YxGINbykm5XVTn2M6OqSFbSaljPWvXWbPLXkXlwCwDCCctHPGZ0H43jhkfE
 HfGyjqyWlWqNqdt1HqFEZTuw2Vy8/b78YwS35DuHuLWrqzVrFgIE/MjcZF6U+mNg4RoNfzOt4HE
 WhofqK3LzaTI6UpEEHMDrSlExbOTiJ9xsYBnvsIzzoH+mvkEVvDq+Jnv4AZLX1ibwC+fHtuAbb4
 ze2KiBok2LzMkups3X4g8kmfwH7m5pBBA2GI7RWYixu508v1zqa9N/xYnMlHFzk9C2k3WFG/wl5
 vehyXWWDziip5oa9f50SsnnFXQgUWNuK9g05WRS2eXYZauaTwF7vAeeo9MZ9sD+dZ2YhwKMtTxs
 VP/ciC6rHDonar1h4tg==
X-Authority-Analysis: v=2.4 cv=drfrzVg4 c=1 sm=1 tr=0 ts=6a7e919f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Ze9qwfLbtIFlt0bMIQkA:9 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 0tXfsBbwakc1BNJNG4TeZIv7KmagC54I
X-Proofpoint-GUID: 0tXfsBbwakc1BNJNG4TeZIv7KmagC54I
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDAyOCBTYWx0ZWRfXwyTIX8z0futu
 oXTvf0+0FqmvolnDW0TZkBcz4sIL+V2d2lZXd4pPsSPrQsLRSVwX3ugRPsfhHrW/vCU1mNi0Yri
 ib9gPNA8eOkuS55B0pyZDr+iGw18VFc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140028

On Thu, Aug 13, 2026 at 09:38:36AM +0200, Krzysztof Kozlowski wrote:
> On 13/08/2026 08:55, Qiang Yu wrote:
> >>> +required:
> >>> +  - compatible
> >>> +  - clocks
> >>> +  - '#clock-cells'
> >>> +  - '#reset-cells'
> >>
> >> This is unexplained ABI change. When you are asked, you need to address
> >> feedback from LLM, not blindly implement it without checking its
> >> validity.
> >>
> > After adding these two properties to the required list, I ran a dtb
> > check and saw no related errors or warnings. But I overlooked one
> > thing: my dtb check was against the current tree only. This change
> > could make dtb checks fail for historical TCSR DT nodes that did not
> > have these two properties. So to be safe, I don't think they should be
> > added to the required list.
> 
> Did you change the driver code to fail when DTS is not having these?

No, the driver logic is unchanged.

For #clock-cells: I did not add any failure path, but a missing
#clock-cells already makes consumers fail to get their clocks --
of_parse_phandle_with_args() returns -EINVAL when the provider lacks
the cells property, so of_clk_get() fails. This is enforced by the OF
core, not by this driver.

For #reset-cells: the TCSR does not provide any reset and no consumer
gets a reset from it, so there is nothing that would fail.

- Qiang Yu
