Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793276838;
	b=d6sFsESCwH8LkNKLrSfgIuQsJgAlAOvJO6cJuNtYK0quxbUeeblUCbIkXgUp1smdo+a9
	 RBRN4CuojLOTio+NWnhfbxSKgKZeFt9NLCE2zw1Lp/V1+v1kP3ctinb+fhxbwyw1YC875
	 +ElkZSc5R/y8XE/toR2XkOFjcz0z21pGbfZDvTIKqWIFmgJyVY3TxD0t3h4aK0LcHyLOj
	 mDLIs6iSI8QbWR2DjGsL/q0mlveqWD/QEli9AGb4kQ0160XTuyBklMgU9ICiTfl5fqhPw
	 0JhWBu2Lm10NgpT/Q6z4zzusQPvCI8BWUxdfyYxIGfvW1HVId0E01/BLc10EIFr2XAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793276838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0fC8hi/16c2Tuk4TI6xeTYKFbOzyPbvhJgiM6+5Rs4s=;
	b=IB+pByi/S3bHgoA7YE1w3YMHXYuNhUrbhimZ/Cys3geUQteKldzV7bn9DZhVRFzLCRuk
	 IU+7qmGCdebkk3kcpYsk+kMx5WZj+pKGVeOOl8LM2DMy0rZQM4CsqnlSqNWXKMWJhSDoA
	 oA7Ra7iec7lVYnpn9xeFIbc89l4gfW79NqofuI3RsWblKBvCwgB5gGU9NnQ8DU97y0Fr9
	 yKmn17cEKoCt/3f60J8VbcSYk9r5K5YkIHccPd273rYALHjpiawB/icU4Vf39hcJ8Ljq3
	 MUvSl44G5sQfTt40EZBU1EfWiXEitH9qCtZo/MqPytnJ//Wt374es8PrxfLRwnfUZ6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XCdQFuvA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LVxsoYMq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6945606A332
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 12:27:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6945606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XCdQFuvA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LVxsoYMq
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vFp33775285
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 12:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0fC8hi/16c2Tuk4TI6xeTYKFbOzyPbvhJgiM6+5Rs4s=; b=XCdQFuvASFXh+8rQ
	oOalrMlz6pRA93tAckZW4YxX9TE6+WhfnTsmQ7EVc/lNrFsUbVlzKYCOCG3aAqhB
	qezpYjrJVS2Gkz/FR+4oKosvN1aBSmSM0ya2xQQz42S/WhegH/uB2RqEUn4rdgN8
	LqgLa2Xz/s1geaIJTxulPAhnIgSZMr5nD1mACiX6FFiRjrSp8Xs+cG3BWmevAjWl
	c4u3+fjmo/R2Cff5S+hBzl7UU4VXbQfIwVp05CPMlGqP9d6nQExtlpvDjyAvwAPX
	uEIPHQfXvUArIqZ2OqUknqtqHTlHARY1VkDVbjQxbWJyKHCUNlSdtHRDsAsXHeoY
	6knizw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkxshsqnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 12:27:11 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3662e7a9299so8279668eec.1
        for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 05:27:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793276831; cv=none;
        d=google.com; s=arc-20260327;
        b=s06I1qtlgRscSGbF7r8QUA4nbfeHYaqwZmDthWPFFl9x0gn6cKoNm70+rrpy7vobV7
         bS9x5nqoLU6TvOzHV469nmPwmlg8L1BmNYrrak7t7AvReO+fBAKiHf407y44cT9yvcYo
         10rMGooCHvkCcEwF2EcTXuu+thiY6gt83z4HVA7FEumdSXJTD0w62qdDvbqvzuzLi1xc
         AQqJDkAtRcN1EcATJMwJdmtU/w18uJqiGO3qMCVXESRHIsJIS2o7ufSuL+WcC8WI+iec
         9UgPBhqY37agDlzcqczsclBv0X9ukYz/ejTJxn545+7/o2z+b8cFAdUzpCZqci8BFP5i
         o9gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0fC8hi/16c2Tuk4TI6xeTYKFbOzyPbvhJgiM6+5Rs4s=;
        fh=GgUQYnz1gGZiTHnQdNa+b0UXkTQF/wa3OfFOQeM3/uw=;
        b=IPfGwEahg2Sz07BeS4m1Q5GqkL5uRkn2XiDW9Uygx5wvYzb3Db767mpDGVTDv4GhLf
         5JvZqmMSAydGAP8tZ37wwJ/94vEqUGGIR98CCq9Fi+8ITzzsD+FAx/z8GPFXps7X0UEW
         ylf9oyjNV8LrOuxzCk/IoQWFu0A4zqxMaMTTE1pOIK9eLaodRzfd3J5Ndmhran6r6Var
         5tcx6FQko5TzS8/KDCwpiBGhzb0aXxEhPkbJigqNOPVCk7r7k0/DwebQ1ydhES50BeJi
         JI0jJxiESMd1/QRhoWQ7xSKes89IOAHhHbHWgxz4/zoL7p2py2TN7K4lpn58XU2N//aQ
         dkAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793276831; x=1793881631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0fC8hi/16c2Tuk4TI6xeTYKFbOzyPbvhJgiM6+5Rs4s=;
        b=LVxsoYMqHYDQ6kpnVtFAtmv7+tKGAxgkaYIIvzYm8sbLQIV19Blu+/UZ6MBICMLv3o
         a4ZSqisTfZL4c2a7yDS58iXx+RqPyriexwX5csRMdSDyn6WfG8Q7atck7pGaVs1OGEVS
         YiNPxCmt1DU62nAk3sLfLQhuEWBVORrU4r4nmTxW7zVcAtySGLRuTT7bdosc2RCXfnOE
         yH+Lm817LWV2ES45zA6q5tedUnRsgmPfBQ4MzVEuTrbsVOuHay/WcrOdKWuPgQtrNfj3
         sLmEco0BY7scuVAjFh8qcWBXXXDT/f9N5qh5p2SvDFntZgN9dQMhHj2h4g8z+tAEDFeH
         5BQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793276831; x=1793881631;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0fC8hi/16c2Tuk4TI6xeTYKFbOzyPbvhJgiM6+5Rs4s=;
        b=U3vG1fNM6Y5VhPKsjCEX7Gc7Fd1c4WuDEPMqHRSJgTHe2bvFbUazS7syjb+a1ilyJM
         Ns9/QjpL0tzG/AQVLWc0XSqw6godaF1yuv61JsGHFHPwSmGLPUlOBm5nxcV2t7BAWzC7
         9EQBMZhz7VvHWVRWrK975ieYXhc7mplJ17xA9DOSnao0P7MJ6ma5eEx1NMoVxi26uT8y
         DvZcdAqiRmmk+TxcpvvfQTlqnGguIbGLC9k0xmvvfzNyZdWhvbq/I+3fd7WVm44WayIn
         nxKjR0NAQ8qah+dg3h6miMTLpp8hSHqNSThuHhweu9zZJ7htJURaSrSRU0UWKp6JOX70
         TJIA==
X-Forwarded-Encrypted: i=1; AKwUvBwSGtB1K0+wc9fWoNo/33V9eOjyj8K8PYxhKtv3p8VmlnhHy5AA6uFKWyIxfFg8l49gok3SqyQCml4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpPlRmNmF0RGmEhHZWO2ZHmMsGBwHuudqCTdEaLuJ2um2lEqgK
	gDZl7IsjfA+tw2zQMwAdT6AzMfIn2YYxNbQlrDPyidzfnJuWhNic2GZptwSBhURk0VOR65trEOU
	459rzBCqaxlmcdwYKYeTQm8kohUXPRL/92Ie8j/1TX1krrLoEudK9AwGZENwirGzx2eF9rQMhWF
	nbjtYSl1HnrPMlPNiyKCo2lKzX7qYyPOeUwkIFKA==
X-Gm-Gg: AYBFou3l+yOM6uvHmT8WKxkNO/UV94LYDqmKApg1SX+Aa7EoEmJhj0k9TlrYR1CCz6u
	E84Y54ccRYoIe8nPnVlXOjuT/IY1cUlgTF8OocLVkfzQlPif4VZvs4jxvv3UZ+P8CkAPHB6cY7E
	822a04TiqFWPVMyLQVq7VIvUVN/HiUxkHATecee054VghqqQhf5pv2ygrE5w==
X-Received: by 2002:a05:7301:df49:b0:36a:1e0c:e28d with SMTP id 5a478bee46e88-36a202bdba8mr7838945eec.4.1793276830559;
        Thu, 29 Oct 2026 05:27:10 -0700 (PDT)
X-Received: by 2002:a05:7301:df49:b0:36a:1e0c:e28d with SMTP id
 5a478bee46e88-36a202bdba8mr7838905eec.4.1793276829977; Thu, 29 Oct 2026
 05:27:09 -0700 (PDT)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930150213.799245-1-anup.patel@oss.qualcomm.com>
 <20260930150213.799245-4-anup.patel@oss.qualcomm.com> <CABb+yY0gLY8VuY0pDKKm4EfS3wp3buLgF=waajaA7JD0UX-VwQ@mail.gmail.com>
In-Reply-To: <CABb+yY0gLY8VuY0pDKKm4EfS3wp3buLgF=waajaA7JD0UX-VwQ@mail.gmail.com>
From: Anup Patel <anup.patel@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 17:56:55 +0530
X-Gm-Features: AclHuK_K8FAHAaVvZrkLzUN4-2TI6UfFRWFLq4Lv-UCwiDI74MI7EZMWtDjZvCE
Message-ID: <CABBgwmsU9S2kf+RL53G8Tk4ar3=6f1zMTss_HmE42fxiwxVFpQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] mailbox: add direct synchronous send support
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Rahul Pathak <rahul@summations.net>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Himanshu Chauhan <hchauhan@ventanamicro.com>,
        Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: KvpsO6il9eiiUF87CgPrzj5_qdSNyQ7B
X-Authority-Analysis: v=2.4 cv=H6BOUOYi c=1 sm=1 tr=0 ts=6ae33b9f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=B1sphXeUGUYvUChdj8sA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0OCBTYWx0ZWRfX+PmGiP2PA2DT
 mBw9mTFzoBnphhjR/XoW2sWjb5A6yIH2oaoq98FIlatbn6horx/lwAXOUI7mvy+tK6G2QWM1YLV
 fsKTpZf2X5TWbhC9TtbA2QdEj3HzIZI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0OCBTYWx0ZWRfX/rvQo96PVXF1
 LKJEpHVxaxDYTm2v38suWLnpUndA+52nHpZEvxBEk402mLPFyTrmFvKRGX5iU8UzPsm+Wyo01vY
 D1arbnVKSs++9gh4wKNUgmL6w1n04sjueVW0VYXZFnzrsjM6/vm1sVIEBdDLQddIo/OJpHA/HSc
 neDrTFJmv7x4HqAZVLExW3HRJk8tnHxh8CJO/bmIWDOel28eMrqdRjWAv/GQ7BbQLMGXWGpOd6P
 2vwgDvNPCJcw+cfkauF6tQzS6l82YAiGUeHqcXLdzIwS/LSMy5tTfOlOM/FOZpPnvtZ45sc1bH3
 FcgjS0yOTSy+S08uSTY4l0O15aBZwPRyHz1hhBeaDnplreFkhrvPpBlhkOpuJ6sZZEpJysYTm73
 FgCd9ESMOUvTOYGV3EaHn8TiiyWFZcyqgrPSNGVZMKmbjmIKh14i7C2b3m/3gMR69IhCDRham0P
 kO8pnZX+fC6UCN3ku5g==
X-Proofpoint-ORIG-GUID: KvpsO6il9eiiUF87CgPrzj5_qdSNyQ7B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290048

Hi Jassi,

On Mon, Oct 12, 2026 at 5:52=E2=80=AFAM Jassi Brar <jassisinghbrar@gmail.co=
m> wrote:
>
> On Wed, Sep 30, 2026 at 10:06=E2=80=AFAM Anup Patel <anup.patel@oss.qualc=
omm.com> wrote:
> >
> > From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> >
> > Some mailbox controllers can complete a transaction entirely within
> > the calling context, without going through the queued TX state
> > machine or a TX-done interrupt. Add a synchronous send path so their
> > clients can request one and wait for the result directly.
> >
> > Controllers advertise support via the new send_data_sync() op and
> > clients opt in by setting tx_sync when requesting the channel.
> >
> > Channels bound this way must not call mbox_chan_txdone() or
> > mbox_client_txdone(), and mbox_send_message() and mbox_flush() now
> > reject them, since only mbox_send_message_sync() is a valid
> > transmit path. The client remains responsible for serializing calls
> > to mbox_send_message_sync() against mbox_free_channel().
> >
> Seems like you want to use mbox_client.tx_block.
>

Apologies for the delayed response, the past month I was travelling
followed by the Linux-7.4 merge window.

We had tried mbox_client.tx_block method in the past and we had
found it to be not suitable because the mbox_send_message() will
use wait_for_completion_timeout() which crashes when called from
an atomic (non-sleepable) context. Our existing mailbox clients (such
as system msi, clock, etc) do mailbox transfers in an atomic context.
Due to this reason, currently we set mbox_client.tx_block =3D false &
mbox_client.knows_txdone =3D true in all our mailbox client drivers.

Using mbox_client.tx_block =3D false & mbox_client.knows_txdone =3D true
still does not avoid the spinlock serialization enforced by msg_submit()
function which works fine but adds unnecessary overhead and prevents
parallel message Tx from multiple CPUs to the same SBI MPXY mailbox
channel.

The SBI MXPY mailbox controller driver simply sends messages to
higher privilege firmware upon Tx using SBI calls and when the call
returns the response data is returned with it. Also, there is no Tx complet=
e
interrupt. The higher privilege firmware may forward this message to a
microcontroller over RPMI queues OR it may context-switch and forward
this message to a secured domain (e.g. OP-TEE) to process the message.
The higher privilege firmware takes care of the serialization and also allo=
ws
parallel SBI MPXY calls from multiple CPUs.

The MBOX_TXDONE_BY_RETURN and send_data_sync() callback
allows us to avoid the Tx queuing and "chan->lock" for SBI MPXY mailbox
channels since this is already taken care of by the higher privilege firmwa=
re.

Regards,
Anup
