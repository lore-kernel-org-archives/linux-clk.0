Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CAC1E5219
	for <linux-clk@vger.kernel.org>; Sun, 21 Sep 2025 12:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758459576; cv=none; b=SoVUt40SkZlT1NrsBykwq92saJ/tXJK1ssG3J52p8KmUrbfM3B2nal7Baz2cDHYjSEEi9JUWXrRauqnEI5BCZsO7gRv0P2XcC67GsJWNhtdF7/ck+dMHqOrv9B/a5KdajbfvWzzD88EyHlgOGvbQ1T8Xd2RMBlF4hylaCWVFnHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758459576; c=relaxed/simple;
	bh=Kwb2DR+18jwI5cNdwi8ifKZG7nrnjn+MgiJ49aeH368=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=L2RogZ0W95z1ndCyFw/L9Gs3wlHiVTP2wvTJajh167WPY8fNJ0STiETu02LUvAaUejfJkBazoui8C9pC0S7QJo9MZLWZbfM43+AleIBXXJvEr620cbntjZzn0dPzNHcxSxaAi2lTCp7q5TxgFOuwSXfrCQiqqRlmTqpDpoyWuwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=MFQXrB4F; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="MFQXrB4F"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3f2ae6fadb4so1532321f8f.1
        for <linux-clk@vger.kernel.org>; Sun, 21 Sep 2025 05:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758459572; x=1759064372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5idkSU+BKR3ZQwW7g3jePyMPbexa7ttPs8Jbe39d6Y=;
        b=MFQXrB4F2/UhXsFMNENEg0w/MOuZKTANXji9lF1Kpz0qw5n3GVUVUVNeNwgMJ6Dggn
         KU4XxWCEksgV9+2IrGcI7vBUqAR8CgIu3SgrPCRpxU1TxArXf6lGsm7bgqynWsAdmcuv
         YvjLSfIbskeGIzjSV4eGKR/czaOfGM+RqemoVE0d1sEWqcZhe/0HdgX6BasIiP14qawb
         5D8MPAbSaLmGfmeDiqOsjWMtxC2IrF18Zjk6zkm7gcGQu90TDqovIpw6Q+7Th7sxl9XN
         AsNEvJ7CsqapHqhHpQ3yaY78dy5qcvMhdykZLmet/U3gdXM+nuIFJaapE0kVb782517i
         4yQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758459572; x=1759064372;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c5idkSU+BKR3ZQwW7g3jePyMPbexa7ttPs8Jbe39d6Y=;
        b=B/83uWeaqOPivm3aorGRmpKc/Lc0xar+S578RXimjgKfMvC+Bjf69yfPAr+PJmdpte
         W2nhOy2HwuHnlTsE9L4KD+4vFSt64tqTpgxP0Yra2qYIElPLmWTezT+cJC1jDkC3l+DS
         iIKdP4aIRC2xWRQB6tt/yWwfbNHkyhjtdaj3+9KSkwt+sIvSHcm5AW92jQeQwqjT04W3
         GyDrRmmlAgsg+J6S5zKhH6n4R01OMTZIY/IGj/V5kVZ3HOGX0DCK2TKL4sMnwQT/WQl8
         AFhsFkJibV9yjR5E/29GStHvnAtxiYjfmmv+4mPelgeWnKQKld9kG11cKkG2fdiur9/G
         Hn7g==
X-Forwarded-Encrypted: i=1; AJvYcCUnDE2N2kdsy+15cgiIBLMl3H3PfsTfbXK0O9i5CSLonMOWS5/3mfrD/8mSlidReVgQ5QlY9/Gwop4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6pRzYljypepLuq6w+0dRYzD3L+Wr/C20J2QAY2QNKb8tTL0Pg
	AL8PwoBrKDGWilmZBWC4XOp2Qe+T+51OPdwbdmY0X86usft1+RINJtvm+Mp0TfSz9+A=
X-Gm-Gg: ASbGncu+maso3keC38oXvFqkgHrBo9fhGRnRrJnOJkYaFd47lC2GWBxR5NaNYlSTdKd
	qqLsI+c8RyT42nvluS7QWvlNS/ye4s039uLMplfuH+UgBlwlcwihXqEumQHtzouOKOejuPhk9ce
	h8aq+ulkX7FJUU1OzmQh0lmncE82BJGCPRruMmKSVKS+fy6TWlbcXqC2DWNx/tNXyGVj+ZLxqSb
	OmoIHu31opanp9mWrtBgUaLLSOY+8TTkGV87VvuLlqPKMZ5mG2J4yVLCv3hgS+n5j6snJlJq27R
	nOoJkbVckQCsPDE8XtS29s708fIxdUwCT7p8TPVU9DubBVEttaNuMzp8gowanxuPazrIFKmMkij
	fmrOs/yn2ROAmpcPwF04p
X-Google-Smtp-Source: AGHT+IF5u5KFKGE6iHPiMYbq57D+M8vvvTozHCB8HNpcyQ3vLH+m58k6knvjof0DtBjLGD8fC8CtWA==
X-Received: by 2002:a5d:5d88:0:b0:3fb:bb69:d91b with SMTP id ffacd0b85a97d-3fbbb69dc8amr1338524f8f.2.1758459571949;
        Sun, 21 Sep 2025 05:59:31 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:585:dcf4:2643:85cc])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ee0fbf1d35sm16734349f8f.55.2025.09.21.05.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 05:59:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Mark Brown <broonie@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman <khilman@baylibre.com>,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/26] clk: amlogic: clock controllers clean-up and
 factorisation
In-Reply-To: <CAFBinCBe3LhN+3beovFVuWPpe3pDF5P1wSt7nPjm=ykRAx4zzQ@mail.gmail.com>
	(Martin Blumenstingl's message of "Sun, 21 Sep 2025 14:21:28 +0200")
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
	<b88a947c-7074-4fed-8283-c278b573a7ca@sirena.org.uk>
	<CAFBinCBe3LhN+3beovFVuWPpe3pDF5P1wSt7nPjm=ykRAx4zzQ@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Sun, 21 Sep 2025 14:59:30 +0200
Message-ID: <1jldm855cd.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun 21 Sep 2025 at 14:21, Martin Blumenstingl <martin.blumenstingl@googl=
email.com> wrote:

> Hi Mark,
>
> On Sun, Sep 21, 2025 at 1:25=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:
>>
>> On Wed, Jul 02, 2025 at 05:25:58PM +0200, Jerome Brunet wrote:
>> > The work on this patchset started with the submission of the Amlogic t7
>> > peripheral clock controller [1]. This controller is fairly similar to
>> > existing controllers. Once again, it redefines the peripheral clock ma=
cro,
>> > the probe function and composite clock helpers, even if it is almost t=
he
>> > same as in other controllers. This code duplication trend has been goi=
ng on
>> > for too long and now is the time to properly address the problem.
>>
>> Friday's -next breaks the boot for me on the Libretch Alta.  The system
>> doesn't show any output on the console unfortunately:
>>
>>    https://lava.sirena.org.uk/scheduler/job/1853204#L1606
>>
>> Unfortunately earlycon isn't turned on, I'll try to do so at tomorrow or
>> Tuesday.
>>
>> A bisect points to the patch 4c4e17f27013 ("clk: amlogic: naming
>> consistency alignment") which looks like it's a squash of several of the
>> patches here.  Due to issues with the bootloader it could potentially be
>> an adjacent commit but this looks suspiciously relevant.  Bisect log, my
>> infrastructure does retry the boot a lot on these boards so even if the
>> final error is a bootloader issue there will likely have been boots that
>> start the kernel:
> A few days ago Marek reported problems on an Odroid-N2 and provided a fix=
: [0]
> It's not queued up for -next yet.
>
> Please give Marek's patch a try
>
>
> [0]
> https://lore.kernel.org/linux-amlogic/175834437006.4354.11933545174004616=
373@lazor/T/#m29128b0acec2db62d45971d94a1c38fedc8493a0

Hey Mark,

Being on the A311D as well, it is likely to be the same issue.
I suspect you would not see the crash it without earlycon indeed.

The fix is in clk-next already so linux-next should get it soon.
Sorry for the inconvenience and thanks for the report.

--=20
Jerome
