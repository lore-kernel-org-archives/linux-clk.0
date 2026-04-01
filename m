Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55753DA5B3
	for <linux-clk@vger.kernel.org>; Wed,  1 Apr 2026 15:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775058898; cv=none; b=ca3tD3TYtjOK7Or2/6RjFPCWeJNmEcGBclHtUorlJBN/A+y01zimG1pZfz8/WfXNFqq2D08NgaMsrZTkqdQME/Vphzbbn7MGxdRbsGsAG0wnTlyh9KCSGyU+yaYWDO0j60j+KONi0BmCa56Qn01+rNAPaq7Dg5koL1/ZA2h08Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775058898; c=relaxed/simple;
	bh=+qbkO2vGbvThK38+UmgQuZI4Qx1NmsWO4jJxe2qo63Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lAotOd8Y53aNqDletO4HQ369rjP6NpPqjNtuKduFjycN0wCu399A3b7bpROBE54K31lTVEAMA1Yd5X4IT6IgIge2mr/OR8bPXXGVkhoM1FON8ioFZaCivO+fQv5i8/Q6KAf/tjXshJjsVE9dyMxWzWJJRnhvHCKlo/Uw5hwvQqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OuuXGirx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a47Hpemp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OuuXGirx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a47Hpemp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631FRTdJ3363899
	for <linux-clk@vger.kernel.org>; Wed, 1 Apr 2026 15:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zFK+mlQujJNjbomDnjjDvyHU
	Xm93hR7YZ2pRnFwT7mo=; b=OuuXGirx76+DLKs8D3co8hfTs8lZsoHoBcGmWewF
	KYEH/KyTXvc5JaGHRqQHQDvde1/41yTFPkehGov046JYtSFPWQE2Fqr1MG3C3nYT
	aZXsg5L4TS30gImaoeY7rpG4F/0eQxOmgcukOjgg1YrA4ovhTo2tePixd7/rq75u
	1jXvRjA9lG9CCQ/dJI3zklmg445aB+GCCg+XpMTLM8AF6TcPCUngF/CzotG1dx25
	PpTypfkYUytU9SxVB+jDc/lynX5nG/hSJsI4uGz2qa2hFriO5IQobShO8gWE7kJ+
	gpT9qWK3Lgy6dYpwq+Lvy2oavWsfcHYjYYre2kWxFIGkaA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8nddmehr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 01 Apr 2026 15:54:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so7026752eec.1
        for <linux-clk@vger.kernel.org>; Wed, 01 Apr 2026 08:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775058895; x=1775663695; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zFK+mlQujJNjbomDnjjDvyHUXm93hR7YZ2pRnFwT7mo=;
        b=a47HpemplwS3r6OUDeebyPe+Tj1jtWqNONw9wCJEV8lk27gBLApUeiVSgCKVn1NSQ5
         Wsy62sBT4In3qIyHJdsSWcqh/3n8QUx+Lp2gjShAKtjhu/zPTrld3f2bbfXYOToDUdRf
         p3yaxO+7s4r75MxpcPujRcp/rtZz36+i3F+MXDX36K0ANcF6uXLAbH9gi2pETiR7LrCM
         GZ4J0Gv9HefEA5Wn32EZC6yiEwOavWUhzggO1BtcPfamnAUJJz8FEJk5zmNxiQ/WYxXs
         IwlgOQhSiz6s9Ox/VKab2Ot574KyncPtxYg1tvYD/spK9PyYqbvXNZu3TJP98dyh9aHW
         BcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775058895; x=1775663695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zFK+mlQujJNjbomDnjjDvyHUXm93hR7YZ2pRnFwT7mo=;
        b=iMQBIKhXUjQ5VI1UdE8n1iMdbfbm+OQ7FRfcnqx8Cbdb078M50PlvPXmiSlkOFlfRd
         1OoYu+4nIUTBpOQjGUJgaPZimJ4j9nWGwm7m7EYbNs6VZVikbC28SZDWAa0G+Z5yjCWT
         ZOYH1iZY0vXaXn/rHm3BBioma7MZ1TJBSn4Nh806Y8iQKv37Z312IqqYpW09UvlNjNlT
         r5iQVVlcz1BVTH+jb7PGfJxbgbYfsoNK2MuJSVlHU0FngpOdRTw/xNAXECXj+6CrljYe
         v9PiwgDZ5eRqW7lRun43xyUfR+TaszRoIrOrOPzyoKSWbOlN3OTM9tpMth+9yHo6I2WC
         j9Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXmw+DT50e0j5RDdGQ75qw2gwoSnsiw4SSY9xW6AonzZG8CBpgeO20S3bWgH7iqitYcaCr5tLR6iWk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7SvH2yPLORJW+n2rYFIpjtJZMMFkxg6BKQK1E0wUjC2X8wlDR
	GR1qApxS5g2gPDEAAkIWwxO1ZGio6Gjb7oFXSFpdpMfTZB/w3LuDG81P5tq+PlyPi5fh9ayvj/J
	YpKJ7f/raYAtCjc+rw15jnjaye7pBQ6gs6goE67/vwIBvguOBKGofYBDjT8GiBcg=
X-Gm-Gg: ATEYQzwTYboYKumrh7kMudXt8AKxQQ9xV4w1rEi1imjonPa9p/RPNRNs1s1wRYK/bUu
	OO/5vgV966ZORMHMUNVroT45GbTBijA6TLlktD6/BAcnDfzWQQcE6uTz203Ie/BQKOmMhX7pQir
	eRMt488MdXHgRsSkU67vCkUEmMdkPNg/1aozMockmvuJatXWmBNHVGNZ7hpDQAlwZyWwjWY9nXW
	e7P1pCKXwVj5+MU7CinjDp/4V9XP1mB1XoSlx1Y4ZcbK8ZnIq749LysZ2th+LHMT37EIEL7zl52
	b/MoQ+dfeRGnKiafEH3E0UnWcBGhfgSW4hU+WmC8VBl377aHwUcKTunvBkdkIxFkFlrI0HCSqBW
	ot/vA/7j6v0EM79m7nt5dRybUGwhEhwSfv7YBJjeLXi3TbVkkRopVWhlq4jLSXdkkLqLj8H2jAd
	E=
X-Received: by 2002:a05:7300:6da8:b0:2c7:2c0b:f334 with SMTP id 5a478bee46e88-2c9325b04a8mr1993414eec.18.1775058894775;
        Wed, 01 Apr 2026 08:54:54 -0700 (PDT)
X-Received: by 2002:a05:7300:6da8:b0:2c7:2c0b:f334 with SMTP id 5a478bee46e88-2c9325b04a8mr1993370eec.18.1775058893825;
        Wed, 01 Apr 2026 08:54:53 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7caeb83dsm103983eec.22.2026.04.01.08.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 08:54:53 -0700 (PDT)
Date: Wed, 1 Apr 2026 08:54:51 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] clk: qcom: Add support for global clock controller
 on Hawi
Message-ID: <ac0/y1962gKYUbC1@hu-mdtipton-lv.qualcomm.com>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
 <20260330-clk-hawi-v1-7-c2a663e1d35b@oss.qualcomm.com>
 <acw4FDsIbgAUTHXo@baldur>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acw4FDsIbgAUTHXo@baldur>
X-Authority-Analysis: v=2.4 cv=ZfUQ98VA c=1 sm=1 tr=0 ts=69cd3fcf cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=luiUJp0ABMwvOzxM0bgA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: lEXrAf5fMuUqZv-N_mq4Pfl8xmfHn70e
X-Proofpoint-ORIG-GUID: lEXrAf5fMuUqZv-N_mq4Pfl8xmfHn70e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDE0OCBTYWx0ZWRfX+JG7SgCut3zP
 nmtUby8nwbjEL7qigg0zlTNH81CSmONNXOGyFr4TZhPbsC6O3ajySyOsYFfCl6s1Lj4xiEkeZDW
 O/5KLWJog+zbYDREbqr/cth+2pSjC0zK3IaH6+bmDL1pGDZfTCM1RywX/2iVOJFbk4KvG6e+ZX4
 GowWHyWZZvIUlnUNjyV4pC4106XkfnE2U2pAPGnK0hZqT2T3Eimlz4aO/p4HdSZYpzZ5boq4q0g
 nJGeReQVO8bE4zkP0fOaodms7nH14e0kDEY36OoTLhxdz8MgYOmKLHSC0+6KfBfMd4uc2ydseHU
 ukaLijQaqcDcOOAfMMsV9PNJloQHrKrEWQ6KpxI69DMy/HQ6oC8RAL2GeiNyhvYb3lDkujE4VKe
 cWwU+8pOOSmkwuJqx1FwvFbTTJA/SFAmL39DqR0IpC5T09xEdk4Ad1MOUxPVjffmM9qR6miXR3h
 dVSyQDYbn/TKsawBffA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010148

On Tue, Mar 31, 2026 at 04:11:22PM -0500, Bjorn Andersson wrote:
> On Mon, Mar 30, 2026 at 05:35:02PM -0700, Vivek Aknurwar wrote:
> > +++ b/drivers/clk/qcom/gcc-hawi.c
> [..]
> > +static const struct qcom_cc_desc gcc_hawi_desc = {
> > +	.config = &gcc_hawi_regmap_config,
> > +	.clks = gcc_hawi_clocks,
> > +	.num_clks = ARRAY_SIZE(gcc_hawi_clocks),
> > +	.resets = gcc_hawi_resets,
> > +	.num_resets = ARRAY_SIZE(gcc_hawi_resets),
> > +	.gdscs = gcc_hawi_gdscs,
> > +	.num_gdscs = ARRAY_SIZE(gcc_hawi_gdscs),
> > +	.driver_data = &gcc_hawi_driver_data,
> 
> Sorry for not spotting this earlier, but don't we need a ".use_rpm =
> true" here?
> 
> In line with
> https://lore.kernel.org/all/20260309-glymur-fix-gcc-cx-scaling-v2-2-d7a58a0a9ecb@oss.qualcomm.com/

Yeah, we should. Same rationale, which technically applies to many other
GCC instances that aren't setting this today.

Mike

> 
> Regards,
> Bjorn
> 
> > +};
> > +
