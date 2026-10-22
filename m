Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660055;
	b=VAJ3hbMKshCq9NsQ+vjhst/qTAt6vzFv3rHwK5ZHLNsgqIcRfnxArFXl/4jK5e9sbGZB
	 yYMdCh5ekec5xriHEEaTeZHREzj4x9/+PWNQD/IMLwrYTzSDb88co5TWrC3CoBZkrG4LT
	 YRRJafBBRqg74cLXaQ+Q21PHNgPm6Lg2nxyxQsakR8vS6SGi72ACHkOUYLIGm+2z9b+f7
	 GbmaPlAiWom+fscVxbCHk8P8VkitdX24sFFil76l4sQ5Wet/E0U49xB4SZr8DdL9WCfNR
	 fCj1HFYVWh7KgmbqQw2WUmOooUt6oISrA2RmoYWevafpUlZu87Ys1hwGuZtyMKonE0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660055;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=T9mZuQQYoWWsPIv3lgJNtkF+nm2oQ1HULJ9PRpgeEvM=;
	b=OtxG/33RSKhoZ6Yb4MKqeFr2iBwhJQdlJQcI7DlQeA9HB2nhL9LGAOiXk05honV0mKAf
	 KPBEhSDcifR2uJyZBkPzwjHyZfhu99nl1KSIsvNwslBXsrE+CzjHBKp+symqObMa6vcT/
	 X7KZoDRx0QHwfU1cl+XkneEdhhBpNheFU3mjFVeiQ19yAWKBiGGQNafADMCnxT3w5Zont
	 lxduC3nbdbyrwb9jbyCc2bS3OGLdfkVucmtzbcEtpGHxUG4AQspOAs2uWqTFO61U3MbvO
	 UeBgPpUDj3YZiNZ7WP9OWHAVEwi1gZ8eBWEZxOEsZVRrTatQd9SeBwXsxUTjDNxJgnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M586mBLx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LfhM2e6R;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE04606A32D
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 09:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DE04606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M586mBLx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LfhM2e6R
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70EcC2516156
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 09:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T9mZuQQYoWWsPIv3lgJNtkF+nm2oQ1HULJ9PRpgeEvM=; b=M586mBLx+FD4X+tG
	R2Mk1TD2JkV2EZL8yi89fwMORGIse03JH2vFQSH9fImFtbxrK1C4QJDwi8c7EW7z
	HkKrxUS/8pFuTFkbNYrBO7PTzp1TJFJqN85FeTZVtkLBr8r4OCyAwIPSz6sahtEm
	KK5qXqiGl5dE0Voj0KEydZ5cVu/D+FUa8o2toyysfRgvw7Ma8HpH7q4oQYFQoRxC
	zR7m4j/DMD+wGONv4fxhG7KJlDpnG08roqKcj4ZDhUZiMWCHbtmGxf966hYrUGwl
	pQ/S8ITwYeRR/1CzVPPPk5LtucaHCebknQr2I2QgKLKapzQx6ACNEnR8GggRm8mu
	lduQGg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a9mc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 09:07:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac5877bso48449785a.1
        for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 02:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660052; x=1793264852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T9mZuQQYoWWsPIv3lgJNtkF+nm2oQ1HULJ9PRpgeEvM=;
        b=LfhM2e6RtHdQ0f+DWGwJRSFel2MsfAdRpUu0ZzFipI2hKsOfTXGcV5fUy6ZFlwnhjb
         F/DqiZ7bpJm41DiVto9Wm0gkZ6vZEwiVJQECQxob1BVqA5Lr334hkGd//OQcJpbP7x1+
         aS+eY7LWk1Yd5Ai5jjdIDClLlb51XWShMTa1lOuD/8JfnDijykR35/rgIkA9Re2/0KY4
         CsL/VABoP/ac8skzcSNmjwVCXuphy1noGZfEgUw7ILEejxuEgaMR3NFF7RwuDLTl7Z2m
         fwainCJXQjbYY26ujCbRjQStJ01el830G+SbW2tkxXVNznqvcQgSVcf2lB+0r8EoEP8U
         KktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660052; x=1793264852;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T9mZuQQYoWWsPIv3lgJNtkF+nm2oQ1HULJ9PRpgeEvM=;
        b=cOMaIRXshQZkGqaM018l+N7qOdAPR5YLPuUNcfWRlzkME9w97vs2qMca/e3lUrnMSJ
         0DAYf87aZ6apByO3nhxbicvVocL4zBw1q0FkgDp1yyFXNzpQX9J0KPVf/kJjoarOO9ES
         YgKiuoiVedz0eyQrElt5qQGog4h6Ngwan5xzFEVx7OINbCWJG0N5532hp5pxpPKPYdMq
         qOV/ZKj6P3Jxp2onQ30kLbotWkPLhVrhJPHOae7UUcXFbbqltKuHrSpYTb5xNtl61AMf
         OdFQf3J2aIuhK9O81qcPf9ORhi3nrUWU+uGIzamxVzkk0XXjN2QEMU2+wp5Rt15f9EeA
         pxEA==
X-Forwarded-Encrypted: i=1; AKwUvBzQViRUJc/2sa/x5h3yYz0Gd6+vsVozacDDCQmfrNNWrxYByU8eXytsIVhK6wNfbwBIGezumxNwyYg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzEtR6dK86nXzKeIeezTyeFtO0YggEH4zzFvrxHwc+5jmeocFr
	9GGv9RxZfyZTV857pxRN+y68k5cTWkjC8njgcnRMGuTs0c6EO8cAR3tyzq9UFaUOIupbzRo6+XB
	VirnwTJ5C5NFSEU1GIR6qc+5LGsgbSA9Vfx9wZWxiAB++oTNc1SQvvYcvBUwMFT8=
X-Gm-Gg: AYBFou1naYsy/NqekPhVVc9f6gjAZyBRwchYHWJrDUVFIZJhWwO65xLqc2swq8Hu+ug
	zcaxgrLGdKE480zKjG/iUO0pQ7Wn5p4Y7giH0Z2DafHCGye8LwpHIr02GITHvA5XVfO8RSzrIim
	9Nm/zBkp/0IsBpK8AdxAi0a0LSbXva4/EKAhQ46YA2564F0eiEwOLkDk0imdRAjsRSjah7zF8Dq
	v1N2HGm4kGGnCnS78xY7D+iyz67b+Zf3hXkGwdEOf1IgD7/oxaHiKQl+o6JItwJHP3J6zUklMpo
	0CuH2y4TnUuYjzP0M3VoGUt8cnoMW8r9nL2hwf6cTeqtu079lFl2Pu4fG1sFJNP19PcZNpIm/k0
	9dG+1QayupGUC0aesMatRNw==
X-Received: by 2002:a05:620a:450e:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f57faf861mr1017573485a.4.1792660052292;
        Thu, 22 Oct 2026 02:07:32 -0700 (PDT)
X-Received: by 2002:a05:620a:450e:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f57faf861mr1017570185a.4.1792660051883;
        Thu, 22 Oct 2026 02:07:31 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a55ffb2sm81973866b.38.2026.10.22.02.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:07:31 -0700 (PDT)
Message-ID: <aa18ce17-4169-4f3e-8e25-c088c69db0c5@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:07:27 +0200
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
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: add device tree for SDM845-HDK
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
 <20261019-sdm845-hdk-v5-4-4aa7e22cd0ed@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-sdm845-hdk-v5-4-4aa7e22cd0ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JudkP84C c=1 sm=1 tr=0 ts=6ad9d255 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=YDUdIes_syoG-XcJBr4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 4DOcOmLbl9V-PFQ6zZF6-s_aVIZv2B9j
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX9fcPce2a1RIO
 GgBmkQo81EV1qt1QJ7wkw4OuZw/F5d8ErQSpfZbqGsbiK1aaHP0+4p2LBZM/ukxX8dKiGxDaTpJ
 2KKIPxHbNI5CKOq7B/VJkfsdxc+S880=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX8oCjWZGFLtXs
 BOySB+h8tWiLu8W3FA/eJYiczcbq0JTc0NqUKi3QpPnY8v5kQDrjc4iGi4kdz8RSVTYwaUMm2ak
 eWwhC/U6CxDYn1Cf3Q5OqyD+uzUHGcHlarR9KqAnzrtIUb/XQEEkc56HvvEMMAwNoN4JetulZGv
 iNST05outAUU+f/29tq+DPxnhnGhAcSD7uoulT9aWwI8tQNZeBPcqLFJJ8mjnm9kgwREpixFIBs
 I0UbXlDk2KNh6INQ06+x7nW3/72y9uWkA9WcO5rfkf8o0/gFXKbSPy6mTl26lbaZRogh0NobUUI
 znByiaK8as0dxcjVG59+ZcKI6mb4O+J4+Dib5SqUa2muZyA3S6TXckKGHwoqYf0PAQCpMK0wBBm
 jTGKftyVILN3D6ELXDWldt7hkTkM8a39I1YTY0VV/8UuX/qWTuRhwi/2BsHQD3vwBzVrVaNc9Vu
 Ap3METhjay2VfESpVTQ==
X-Proofpoint-GUID: 4DOcOmLbl9V-PFQ6zZF6-s_aVIZv2B9j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220036

On 10/19/26 11:18 AM, Dmitry Baryshkov wrote:
> Add device tree for the Qualcomm / Lantronix SDM845 HDK. It is the
> development platform using the modem-less (SDA845) SoC, optional onboard
> DSI panel and a rich set of connectors.
> 
> Working:
> - HDMI display
> - uSD, UFS, USB
> - DSPs, WiFi, BT
> - Buttons, LEDs
> 
> Not working or not tested:
> - DisplayPort - TCPM not supported for this PMIC
> - WiGig - requires power sequencing driver, doesn't work with the
>   current in-kernel driver
> - Audio
> - FingerPrint
> - USIM
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
