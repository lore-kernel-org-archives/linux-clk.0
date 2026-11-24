Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795498883;
	b=mqL8fq/PJtjrxyJb7z77iidqh34wrnao9e6a0wj+4KjYyEjJLdABvUgIs8AH+I+52rhE
	 GxkcA3/kfOWcXPuXWbQgoXRjWiS4tF/TMeSlmqzrb9qZDHG2KbtsBmB2AoKG3/6/Ota4p
	 Y/i3U/7KaJErxVLj7gXDoc/P0dWAc71DjKPcZ9BziGRwc5WL+b2Cltn988rMDcnt3Vm1j
	 aSL22uLsPcf4JISYHeeXTPOgldlAEWiNL8xovRK3FUgB0AuA+9NjQHEU1VqFxCDYeM16a
	 DWe/9q4NmW7xd2t9H2pOAuX6M1UOmxOn0d1OEsNcE1OfUWxWtwQh0vtL/cP5xMmM22g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795498883;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VOBU131/4qciZb8oZkVAWZTbJhUnx5MzQKnYpNsi6jc=;
	b=npMOCdviXCG1iWEHMCqvtMT6/i5U4DypbD3ByC/Xlfg1MO4USYMSK8/fpKloJ99QFCyx
	 i20+XmPyiEhmoyyjCdBxn3f0K7bLJoKiB4LOS/xiDUHrbcizqkNDHFOr+CdvCYpaVTHjw
	 pq+0mq7rSItL1lZfFJ2EE1j5GkH/Cnyq+z1lG3ZKGaXSksY51EWAFQ40782/NKgVZyNms
	 7zR1vRoHZBaSEPpgfQowHzTKhSd5WU3KS+T4aNptExjHBLFiz/aCmtVgjfBYDIZWAvP/+
	 Q3tfd5x8j3g0ukPcUMgOAJB+LMzMBKfrAxFsdY9MN8CnmDeOF+5wAA2D5UTNzKHYmWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oG6MJFcW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ioOahv7A;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39C7606A31E
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 05:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E39C7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oG6MJFcW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ioOahv7A
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kOf73851149
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 05:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VOBU131/4qciZb8oZkVAWZTb
	JhUnx5MzQKnYpNsi6jc=; b=oG6MJFcWsXBLrudRR9Ik5L3vYygC3u8KPS+9Nrqp
	lEwi9P+zVtXyP0Hm/GVpcWFd+Q+aXnBzvFqdaHgsABg7IIJIWDEiMetc7hgaMrFN
	ArTgcHoTT+X+4QYJxI1iNF9QCX3B0e0NhMSCvQ5sr1OFuvVCw+0O5pkFx+E1h3C8
	tYIdbh6NqZFmxFEdZ8beUoJX1GCJnamZmrp/ZecKy49KAHI5uU+XCViSDwLPKf/5
	PqAw6cWhdt5HfXRteN5W4c/6GItDcZNoyX5cAMBhzusHstRLJKubypTUECvyvvXH
	ETwjYst0nbzC9jn0JJcWlBf3+UeRU7QxUzmCEjlCbiQfKw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvb11ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 05:41:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so777375785a.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 21:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795498876; x=1796103676; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VOBU131/4qciZb8oZkVAWZTbJhUnx5MzQKnYpNsi6jc=;
        b=ioOahv7A0EoqXXvOho07plftjoMoUhSz/0K6vWzAFCob09Fw0Y5MWge94rVi+iToIi
         vW041A5xuBac3FMG8Vl9kdsll5Xo7OMgeaee3xoP9IAr5Mz6sgnRC9rMzsyGNx1mDC2q
         dRHsTGCSkhPXdYWk4sDr9XzkNn3wL2Zq4onqC5COrdKdj6LKEIQE1T5pg5wCv19qOcwT
         ffO75QdADBaNu+GkHIlv0ZvRj/baZtnAbukzj30xlwtBer76WKHgQ+bJzCTzLyvOJyT3
         +TkzBJoGU4eDXCuFrC1r3bkl4J/BDq3a9+HMxNH6Nv+mXIyAVrPUch+hhkkUvq05AWyP
         RU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795498876; x=1796103676;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VOBU131/4qciZb8oZkVAWZTbJhUnx5MzQKnYpNsi6jc=;
        b=ryUNsiGTPqEBKM5a6JVfu0TiXuKKpdDS/E1a8eiwvYpiEV0mKK04UigX40KG4R0WjX
         abuRFsSV7f9v1M2ZMpmpO2WTbY5wjwTU3xgo7qsFZk6ilRLsbtv3bVJcsKFzxfprDR/0
         0ocp1F6nyL9GMUIP+OpKJSlQ7Ye7w77UX+SGFiXBg7ed+Uh7hMBWKrfLnDArhPE8Tprm
         YyrZAdNaKfC/JR8DvWfYglvjRBbN284q2v4yLgeQUAw+LVSkSNpPQShTPHbpb6A5FGAn
         OdmexWl8xDxRVjlwhhViT+NbRmC+rN13DUVvRmWE4l04WiPSspWxYctKpuPevKrPBzqS
         LT9w==
X-Forwarded-Encrypted: i=1; AL+hErEZkGr1RBegb0jlpl2hI3FnHQXi7cPnPAq1rzYTdOW9eZFk2OIYP2gXTSxqsUUQGr7p2NzxXkettHw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zotMXDXc78UzpU2Lk9/tmnWShhe6c2OrVTiEHwGl34YK0/98Y
	kvFNWWRB5g2AxqlBDDxwfXDEovJtiPnxfKR/M5O8Bva+lC+w/13HAUKE6R1gqYopLEvl2bfr1/8
	Z2gHUmsZ+UhkeSSGpCVLLqIkPoa2791uwrRjDlK58vZL6TiazX/WImPVU6h68nZTJ/LeFRSs=
X-Gm-Gg: AZFdTZcj5mUrYBFQUoC/kf9fbCfx2+H8uwG0e6jrMNWGiwKqCCD0solcyErM6H5FvNa
	MCLnduhgQNcjXSRaKCnmHaN4Clh/OJjBzyJGKKqjLRQBtcszgbm8r274z9lwOybkr1A4R/Sdvqd
	VwD3KCsMFj3MlpFh3o3/qQXOLQDSh4doVpwakQpPeSHa6qCzv6nuaRAC6i4b2gEIzKm/iEDR7X8
	Lo78CFw8hbzOWPuC0ngk++o4ktqIt11Kqeaw8RMeeTp9EwGMwE/BGtbD1bKHHn5dcEWELlQqADa
	gjd1FEF7lQH+AAWjaXRNk4esoR4yBy+QWK6uYzQSU3N2ia6rSK8QWuEUt1KMCZ2Qs4ISZmAtxlt
	3nFF3/TRIVYsoebvGZiGgq0gZgbzu2G1VUUlzHrfP8c0aUkw5sfFHbElSg/dKjGBo
X-Received: by 2002:a05:620a:1305:b0:93e:4e27:359b with SMTP id af79cd13be357-949ba96b838mr2342713585a.24.1795498875736;
        Mon, 23 Nov 2026 21:41:15 -0800 (PST)
X-Received: by 2002:a05:620a:1305:b0:93e:4e27:359b with SMTP id af79cd13be357-949ba96b838mr2342710785a.24.1795498875152;
        Mon, 23 Nov 2026 21:41:15 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm484009905e9.6.2026.11.23.21.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 21:41:14 -0800 (PST)
Date: Tue, 24 Nov 2026 07:41:13 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: apss-ipq5424: Drop unused qcom,ids.h include
Message-ID: <rkyw4fpc6t3jwgldvhgbos7ocbz4m7ux5xn3sc6vobm2l2yrte@vdb5gjsv2q3n>
References: <20261123215842.21088-2-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261123215842.21088-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6b05237c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=tWeuqc_IvAeSSrr3ltwA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: CslU7J2Mp2po_quJLD2kKbW8sr6lKBg-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyMiBTYWx0ZWRfX7pbnOIM0+ifh
 810gxiEWDVQDIPIXo3Xxk/RcBt1DBDjULBG7kSvfhavE97BO4h4D2JhKPyk5JmIN83RKLpBCc3m
 Da/QnV8cPGWXLUIW18v4SuLHiMvh1NI=
X-Proofpoint-GUID: CslU7J2Mp2po_quJLD2kKbW8sr6lKBg-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyMiBTYWx0ZWRfX4y2ADBh0MhXx
 2arr4ORv6pxrTgk/BEyNnoTEHLGWZ9jY65hkogB7eeDGKlr4wkna3Qiy5ju+pe7U0wblfWt5bqE
 wZSh+qplnUZVnmCvbSRwRD1hsoe7u+YP/wZSMY5PQ8O6lr1y3hqU14tuJ6W7Nc4Kk+afQdn37G9
 2fiesog5zX3gX9/4nz0xhpSHhNpoANQcMRPRtFEN/JEwKaXX5jF2bQHHaUSKB+ZxFICkgc0N/ro
 ysvTl9U/Ilr7EzeYWWBa9agJekqr9fvbqMHWusPnr03m0U6S29Ft8/qzXiY2VI9SWGRfxt8HaXX
 gpWDVombXRK3NIKbHEFk2+epcSRpPUV+57ndlyAYaspnQ0fH22lD8sdnq9MkLbxVkCRqASZyCeF
 e6ManF5b9AJlgjTLi0Ic3cfOWtBEnlZ4wo6d4cbCAfFHQbMwMa/AqoTSCNOsJK3sXzRvJqLM9wO
 NSDWJ9CuZnWvQmrMGIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240022

On 26-11-23 22:58:43, Krzysztof Kozlowski wrote:
> Driver does not use any Devicetree binding from qcom,ids.h header.
> 
> Suggested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
