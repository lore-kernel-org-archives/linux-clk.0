Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407407;
	b=38O39dSQN8Iib8upN0740Tx1pBa5j7034WbCcAZpwbaK/nXgFOaf7ufF+vXM3En2L24m
	 D1FZTC97/eRYqEFQWaDzmdqVEBhHKBQt9zy/SMKKTM84NJHxSmph3Hb1m25oWAhoC7HrU
	 SeYdVwS9PKd2zTSk2OlSbcyhtnrrsuZTYh1uAnCliXI6t3nsyN5cBhqOGhFh+2jasx1A9
	 EbQboC5lAueS14Wtl8qP/HrfgjjLVdPucolHL59grRU4kazbQPMjKLr37uYXrsQs6YCiA
	 +BNoMhbOrYkpKR0GzGtUuxM9zWt4WjH/r/mG/JbKh4Z5qi8cdRgpzQNkFIRurzwcg1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407407;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vGEIt+0d09kkbPmVgRK9KARCj2NgxxPeIMDPZW+376o=;
	b=HIbrdyl2f9lFEp4Xve31wY+MHmDbzdL/jPZoZutI4OUztvTKTqdPmvs1TZPvKK945fKB
	 kDeM1j+O7HpyD1K8qSpYl7CezwMQZjat5Ob0m/8MKxQuqjr95BTnSEPYkekR5YBTdgN60
	 XnaUOVzkhhO7k3Tz+aGGRtF9dMYrRxE25e5N2vMMQ1dcJ1RjgZ9+2pdo5iksWnE5Edlw4
	 AVcK+PPeUxIXcYeEEMfwf3wSU7N5Kd/19YBO3IF9fyexjhnLUsbWpRSUGpMuRvK/an9sd
	 AEyf+0ABJsn6K8aQ8rtirtmOhWsiTOtax0hfiOwC/NtjozksoG2wGPGFB7a1FDnEndg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nxEl6DAq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X4AscMPx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2C8606A327
	for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 14:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B2C8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nxEl6DAq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X4AscMPx
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEHTRK2556365
	for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 14:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vGEIt+0d09kkbPmVgRK9KARC
	j2NgxxPeIMDPZW+376o=; b=nxEl6DAqnVqU3uwhbW4/zp6ad3IRaesYmmV+nVZ1
	3ja+Jh5Nbo36D09D/fHZ2XN1w66Un7liWFyq95iL+h7LcoDsolwfjsvhgQ7D4cfS
	aK6VqcvLEk7jkHcxLCfmRhU8LTHnot3vg1uXgeL3zpc0NivLqrXI8f73QLWG2sw8
	xT6PGbCJ4x4CgEjO0ikVzhy3FohBc73bl0NogIQTgJrpNy7nfVB7QFpsXtXIv3ZV
	9L+cUvjSMRzvR1RbmDvF4sD09aduZClRpci/pE84CF0KLuYzYj8GD3qYSiXcjeLn
	ySPyLhX72ralf5SsOIjVNdgkkEVneHZMBYwNW76JJI1Qxw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnmb2bt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 14:30:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf7856ffso730174785a.3
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 06:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794407405; x=1795012205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vGEIt+0d09kkbPmVgRK9KARCj2NgxxPeIMDPZW+376o=;
        b=X4AscMPxrdED3fsmj1XunppdOq1XIsB9mno9fLW0GY5i+Dr5HYodA5su1Yq7ETub2e
         S7ASDcQD8hwhZX9GsSu2yNAlzBU05RC7wBELly5GZ/NoH5LcSqxxmSU8VwEZMnKv2UIZ
         ZpIGQD+h+iNMof+vhgWq7pgIvo3Kmay1kKi47zUzhe4LCrTxGEoh73VFfVz3uXU22hxj
         QmoGr57dR0FrfldhNrY7xcHVvfVGZvdWGwj6HGGUvtKb1vCZDItEdCpe6K7A7QQdmpQ2
         8yKLVu8LyEIt5HNCRIGSazPFXaIj60JBGyYdrePNQIzyCv3hls97dl+JHcWYUH/Qb8UW
         K7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407405; x=1795012205;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGEIt+0d09kkbPmVgRK9KARCj2NgxxPeIMDPZW+376o=;
        b=m9tJnCFnSNMZgNKr/oS9ivTHZdvRWMOqk3gX8mhe+HozHnMs2kBbXkOZDxRpcrwGV4
         k2PJWRspuXaMb/PF6J7yoG6zrWFAjn8/wXnOU9F5uYDWtUvrMDiAIqeHqSiEg50MwRIk
         3C6rcSK/7jXSghii5Swbe7qk6LnagPFooHffNkteSs61yovH0vBxdSA44e5IrA4qPQxd
         OK930XOkNwr/h+XjFmsuh76fGt9aPn5MyUSXkFamna+A4WBWF7vhn7O4nlGljGHMjOSI
         T4g0wrDOghtiAArOLNE2YGyCPEMo7m6hmvAKUmktEkn8o/s8kdwCG377ZFl976k9BGXo
         NHhw==
X-Forwarded-Encrypted: i=1; AL+hErFMJouAPN5RAKWaEQ9C0BAN7KTd3+J0n7+7Wwqdk2KmOe8yPK4ZIINFaSuHdgHtP/GGgK4YVT57eSs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FhB1xcxJpy5j7BrvVm48M4JCDEtniqGHHexeQgePvZw8vmy99
	g7P0l/YUIm/k4nu3cfiYR+AlxX8qlXbQSZ2ViEFBe39iuX1StwXuFLOBUNHx6o8p8o++0IMXfZ9
	H715VpUvBaC4l7tVX369dAgMS652sOXTS6cfEpuZaMJT9oEXE3wAHFP8Ny8i8WAI=
X-Gm-Gg: AYBFou0DZvoWRoc6VLv4mFA3dkkVg0FH40K4USSgemOeGrG/3azi86gGv1uMqqaC+PJ
	pRTh+W/koWnupbtWAbtn76ymH3+48ckTHuaHivphn6V9MQTV6zp6lqSZ9QZUhxiyfpDblnbAZRg
	sBMTlq7WNZIQkL3X6oYLc3W5yNmlggniN6MYuVJk32+hDb1HdXjWn3sWNbdJcUGziZYN5iP+vcd
	9i1hZKCTSwMzS54INxDsRKichl5i9lMkcp7hlrH+V56GfeE2ZVpYW9USv2Tf39RI5mIK9aZ+Gix
	BI+k6MAE3SiqGmR1zh8jDsHNnQSj2jDByrhD6rms15iWYTFyIJQTw9Tlv1gabJ/iIryEAm+ezBG
	AZnIp6fSbsSA3WIGF+2I/SidPD5Ed+0shqW8OqUc+RIv1V7mWtZzb5JvMrBNKnG+Q
X-Received: by 2002:a05:620a:199b:b0:93f:1823:308f with SMTP id af79cd13be357-947b00cd286mr387697085a.81.1794407404588;
        Wed, 11 Nov 2026 06:30:04 -0800 (PST)
X-Received: by 2002:a05:620a:199b:b0:93f:1823:308f with SMTP id af79cd13be357-947b00cd286mr387688385a.81.1794407403677;
        Wed, 11 Nov 2026 06:30:03 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3fd2sm12095367f8f.52.2026.11.11.06.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:30:02 -0800 (PST)
Date: Wed, 11 Nov 2026 16:30:00 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        netdev@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com
Subject: Re: [PATCH v2 2/3] clk: qcom: Add NSS clock controller driver for
 IPQ5210 SoC
Message-ID: <zx5rw567pockk65r2joresyzjvytukupcrshtovnnyovmrmhba@tbrrnvlrebn3>
References: <20261111-qcom_ipq5210_nsscc-v2-0-7e2c1dda3ed2@oss.qualcomm.com>
 <20261111-qcom_ipq5210_nsscc-v2-2-7e2c1dda3ed2@oss.qualcomm.com>
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
In-Reply-To: <20261111-qcom_ipq5210_nsscc-v2-2-7e2c1dda3ed2@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: qMJfgMMDTI7lRbs_x2tfUDBCk2LfOOq3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX+WbnSL+UpkvB
 fzsg0fSsR3wbOlRvUcYNnfc9+KgifeNEvvzuG2R7T8tAYPJHxS9LJ32h9OzoxaaROwIL9r4QOi+
 NUejpZSbBzxJwbWtgwnQXR2M5anvpko=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfXw6MO7Py88jvZ
 icgw5xHdjKD+29l6d0Gb0EV+ljy5mBApsYqI8HNkGRLexP2+scqJyJRvrwAo8ZC0RYhRHGv8Zch
 IS/dWeW+k1J6cANVK9Jk4vOTSFSOjoB6W9x6VWoKGWHiqvYSuPHH+m9mbM33iIX1PFsFUBvd6IS
 rysYr0xS2Bz/9SNILB+pofdWDRnx6XNdISEOKB0dJSPVzbT8df5tpnCP+UfrnZKBzVkhw/cs/7/
 SnDrKv2LyYkuva5XQAa/pnMOXlwyDcuuOEh5RyDUv8OvPBnGvlz6YvR/mnYG5X3o1MRfMTmv+G0
 pjgf9+BRJ7XDxfep9N6jOPNxqAMRJdqpdV84LsF8AzFVE8B4/F+FfK/8/5y9ej+mYJBHaIcDH1x
 IdADGcjhPnnat+dBvVgfWVQVHgWZlwF4GhrSuC9SRcwfMi4/oqRp66noqH42yakuL7sa+3Zvkda
 6xBoZnVZXgseWJ5m8hA==
X-Proofpoint-GUID: qMJfgMMDTI7lRbs_x2tfUDBCk2LfOOq3
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af47bed cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=XlM99vnl-FaGDs3XFu8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110056

On 26-11-11 02:00:56, Luo Jie wrote:
> The NSS (Network SubSystem) clock controller provides the clocks and resets
> to the networking blocks such as PPE (Packet Process Engine), UNIPHY (PCS)
> and the integrated Ethernet PHY on IPQ5210 devices.
> 
> The icc-clk framework is used to enable NoC related clocks to create paths
> so that the networking blocks such as PPE can connect to these NoCs.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
