Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC39045BD5F
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 12:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118326; cv=pass; b=YregyVzVdmh3l3m6FmJWaVdQ9yzNJo5p9RKeannemFIms5GuJw9YZYN8L2UGHfLhF8iTJd2THkuWVlRP883KcNeOJysoJFZ3Ik177MVVAeSGXh/IFSfFbKl7eg1S9HbtP9unRGB3UMueltwoS/G8GlBbGbTCQvBsMybNpE8aemk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118326; c=relaxed/simple;
	bh=s1XP3CBX1vjLoCZEqWTUBRju6xstvuxvI2ntg39GLR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IwQINXy1bTzgIUluye1nxFNN+C1z7CIGED5lrk4rYy5MUcTYn/9QvfRVUiMkA6PUTA8WANKaMOUD5XJYMg45yKpdnfcPJED9VbFmCyZ8/+/DYSPRwIlRRtTtvWWm6hMrDJucUGvKGWHixG/aUNCxgHujvBvxgJhJRQf2Rc5hBXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nmd5qbkr; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nmd5qbkr"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39c8dbf4f38so20012021fa.3
        for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 05:25:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784118323; cv=none;
        d=google.com; s=arc-20260327;
        b=RaFTLhMN0wq/RKoNAMiM6UMYob2Za+Hqks+qeUfKqMnLkSUH1Op+QFhtiJLhV/ddfm
         h3dH4sniRRTInlTWxnAPt01ZiMK8gA+C0pcOogE+IsXXNUq1soDd0jMVt2GgZKalnReT
         rlpoMzDnsLEzpuGAc5WX2ijcdkupC2Sd5RnPmak/CElZjpev4eZ9qjwGX6iZ8qgdbI8k
         vgOGu9BFRxPPMltuiWxVq2x8lc3UpynFMx5vh4OMX1vOKb8WwarJEK0QGkw8gM8F/4rM
         hU2HdWtNRAxREQ0yr6nYCenrGoZ4u7UarlfX4QbkBOXDlUCULFB0DC8JVFgjfe2206Dm
         xgHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=phmAAV/S+5KnjhMYpBu8jVRdoI1pgmVSU2EZUZpX/q0=;
        fh=OSolJC7skvf6RaldETO2+eDlNuPQY9QnshpNI9kdSms=;
        b=R7Z6JOTFgkvzTINpPE7RX/dU4+gnSCxbaG4aLTzOzsDFjOjxfJh1k9YPgQA5aTmzlT
         saDNbNJI71s+xPynTWMH7tTdCyvOWqCdJNPw+t4+NYjW5JaR2Jw0Toos+NhQ3pepq6IE
         cZns0L+/ZbVIwCX9RtZVU3meqA0RqliJvg1Tl1dUDqTwRLCOWE6u9R7AB62GwIE3cd2R
         iX+/5wXGGNVgws0smUOKyPMODAjamZ7x0768TGNurw2zuROpXv3WTciNas5wbkbWdi42
         d/TZCN0cZacMnMej/R3GuEUefYoGjvAlKarEJK/4fdS1nMThHjJr04vJoglFPa74OBZu
         Zpzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784118323; x=1784723123; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=phmAAV/S+5KnjhMYpBu8jVRdoI1pgmVSU2EZUZpX/q0=;
        b=Nmd5qbkrQU1E/3wSaxS0GjfkyNQPU/XKhIN0gqXHgslyspryt/Ry8Qeh3y3DUvwToD
         xtL88Z5iqc29xv5Lf5VQmdGs/hwfJ7GMSjZa3ww0Jp8xdG7wZB3M/Wovsuz8BxAfY3P+
         XRWbePAgM+9J6wXomvVr2AUmTvsFA/5ZmJkzw9MYkC0sD8Ye3Oc4MI2WWOHFJEe6r0tH
         kqWH+i1gyku9/bsUMfgktvZ3PbwNJ01N9n36vcsi3l6266boZ2T2Xxpj/vptRSRy/8Bm
         DcleDt6cRa4WBSWevcJXlf+JVDmZjremtqQZP/qzkcYSrKLrlYW5mRbbItDD6Hn4Kdtx
         q8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118323; x=1784723123;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=phmAAV/S+5KnjhMYpBu8jVRdoI1pgmVSU2EZUZpX/q0=;
        b=XdV7SPZ9iIdN7J3MMlJpZLcm/BQ1S1gRBPVhyFOtLWs5ONHMSdmpVQOcsEAI9yzL/A
         nRcMFr5xpf3XCu7N+UYfRUzyPaYudom5MqnTftiMkbKfURkgQ0rw4A5Sipj1Sa5A176n
         s5jEnJh8OXQzeiyshiGWw9GGVj9xJ/JEqYLFR5VJjZTLd9ZXb6lb5BIiNhjszO/Nbgtz
         VT9FsjEw2rgo6o8FUANNm+LaUX2PW5ygvXfkdEItNhv25Sln4Yr0hDGYiS2SrYqEjuMV
         XW1oJK58foSMLZtiURXqY8Fyp4Azf+lOc7QlyLbBVmGdY+IHyuJId670PUXDUO59RHBR
         Dd0Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr7zoPLpE4hmJ2VNeoHAoCHdB9XF2xb1uMZ7Z0oLihe5DyiaHBk15iM6p2qQvYR6rZWVAYAKX+72Oo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWVhaOGA9y6wgvke3SNoiKhlhAiq5vcivQKrRYcRr31RxLja55
	nwLVReIyTfBWRO4VRY5kZq2JHs96GN8OThOzB9TlQ6GjneZfZFwcOw3BI0zYMYynT7Kmk5/056f
	hkESMsy0GIjvI588NjCWx/oGc5nI8+s8=
X-Gm-Gg: AfdE7cnQ86M16CvRPRDPHYvYV5X08tRT1SzIEQ9H70bmHBH7YDG2WvuuOxKJ0IlcLWQ
	b8iDHuJMb2ivSp9jpbJGvW2H8Eckh5aDZxF0KZ+qkGwQDHufjIQ7N8I1jXDLwj2yd9KVMNkwFKt
	SM+6jdYioDyhqYlyoOZXyd5aSNDQ27/SJQcr3Li4Pp2n5OWlmyxEnYUYJe6cl6K9kf75432Uk1U
	6aFn7GMFr4ebzMY/E/XN+D1qS+BAvu9eLIU0Q+DwVgEqAOPtNJdFVX+ny+cArlLupcuKRHwmNbw
	4Ss4f2dPALTD4SY1MCxbE+PL5doSnh5FR9CRtTGroJPPBoBo2doWKw==
X-Received: by 2002:a2e:a994:0:b0:394:3b62:b6aa with SMTP id
 38308e7fff4ca-39caa14ea59mr36819751fa.12.1784118322672; Wed, 15 Jul 2026
 05:25:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <178370682987.2572738.13491033810212556744.b4-ty@kernel.org> <jhl7fic36ec36pyaduw6xtmgvr75sxurngdykljbovdbt2j23g@ezon25dsv3hg>
In-Reply-To: <jhl7fic36ec36pyaduw6xtmgvr75sxurngdykljbovdbt2j23g@ezon25dsv3hg>
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Date: Wed, 15 Jul 2026 07:25:11 -0500
X-Gm-Features: AUfX_mxYH4-79PzEKbul0S_jMoxLx16udW5ZOUTVeJXUFPAxj9_qNMvYlkM_evo
Message-ID: <CADi83T4bioudCtHk03hLkOf7PG2up0gwoDTWGaseGh2m3R7ecA@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native
 ipq9574 support
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, krzk+dt@kernel.org, 
	mturquette@baylibre.com, linux-remoteproc@vger.kernel.org, 
	mathieu.poirier@linaro.org, robh@kernel.org, conor+dt@kernel.org, 
	konradybcio@kernel.org, sboyd@kernel.org, p.zabel@pengutronix.de, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Wed, Jul 15, 2026 at 2:58=E2=80=AFAM Marek Beh=C3=BAn <marek.behun@nic.c=
z> wrote:
>
> Bjorn, Alexandru,
>
> there is another, much newer series by Varadarajan adding ipq9574 to
> wcss PIL driver,
>
>   https://lore.kernel.org/linux-remoteproc/20260713-rproc-v13-0-41011cbcd=
a3e@oss.qualcomm.com/
>
> I suspect these two series are incompatible.

The compatibility of the two series was discussed [1] with the Qualcomm fol=
k,
with agreement that "it is good to have [native IPQ9574]". I don't see an
incompatibility with how Bjorn applied this subset.

[1] https://lkml.org/lkml/2026/1/14/300

Alex
