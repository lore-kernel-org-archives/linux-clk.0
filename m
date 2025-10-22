Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6029A1C84DC
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 04:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761105672; cv=none; b=rG1Km+Li1EVmgOjTP9lj02muVlzobnILmD7oyPSULn+m512byZl/OGfwcmD0yD97szhebMBvQr9pJ/WCW/md1RyyMs2MAbGyTYTpsWU8cd2Agz8SObT9KHwo6TgOcASm52v5jCCH75JCiqn2BaYNJXErivMP9zVQ+CtgT3vuQck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761105672; c=relaxed/simple;
	bh=1G25WWOEC3anIDwldLhC009T82/I/q9FTo0jvkxvu+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IB4jEuOrThv5dRobFLf8TsXQnp9YZpReE9ca9YTzCy26FpTcriQnNvNkHoHuA9j7NRRexMEcmPqLRPssoAJYNDtwCPBd91tYKIKE7IwoLQ5dYGJM5xa46l/dwALSUIZXYbzoCQFSK/c5krE2Hnmh/Hf8HuXLYUKfvBD/Y0eCNyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9cipteh; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9cipteh"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8608f72582eso437040585a.2
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 21:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761105667; x=1761710467; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/FaidQFPNeI/+43osVNZD1Ak2WA6Z3FkGiSqeL52F0=;
        b=j9ciptehjCcGvVkIJr9+EBzgvtg6RLc2ltFexUYf5SER1Ix3122h8dHCtyAkOk77TP
         Tr+SK5Dmbu3cI9MEGacz5GM8qFO+UpYkmy172q4w6P5QbC/XBs29H4zwDyOUtiB5+kLt
         bqVG+J7EpP0D202b6l/GC6ApQDXZ3SPLFfIitMSfbqDLGfva4fOUdZK+YWu/RSX0m2Ek
         hnTw3G5Ve8058Jj9KrGMf2gh+YbBR5QCQwke6JsOSmYadWdxfNvZG6NCrdRyP+Klio+I
         w4TCPrUIwlEu+iJsU/POe1hSyuh+Vzu40p5/x8g+SVNkNpWWVV88R+cd95Jn6V48Ua4B
         vA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761105667; x=1761710467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n/FaidQFPNeI/+43osVNZD1Ak2WA6Z3FkGiSqeL52F0=;
        b=nWbQHozwSMsW/56VNu5pSEZu8/hadsh5ezqNd9AkqeqxXPYj4gKEqzeHOlGN8fMuJL
         eaFyoWg5e2rQ5dB0za5BU4BoVp3MEzWM9PQCMsb+W5qdpRUqwsKLDNXBYKaOz0shUQrS
         5AjWbRDrPQwj4di2+5shQXMmTs69u6C2vZDkmSvnW4kTLaW/moGXDwRx98S2Yv8Ii8Ds
         W23YD0865ET5uGT+bq6ekb0i8gjnpPV2BC+/1/F+VNk2KlFS9EI+3VAcsZYGyOM5k8Bj
         ArPjDCPgQG5JXL8OIkllj9FRaIozV44pzRZRGFwfETVAXwmFtVayIJUqmYb0huai89h2
         67GQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFFfKM9jDXp1/askbdzgJ40unrrg8pxPiGBFFsVjGNHlIKorNfjIaTZqVd0acUdfOzklrcBT+53kY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1LIhq4V6z7QntccWFbUXs/+4m1odAnxEkQRd7zMSAVna4rEK6
	Ovw3QSqqhBXFc4REJB6BQOwjkbSf6YqpDc6wMfgmAASi8KNmOGIGg2ym
X-Gm-Gg: ASbGnctYd2Zl24nWj41Zu+6Aau8sChyLiSF6XSFk1UX4Q6G+pzRkIprA4CvpO+yUEDH
	p11MfAQfPNUS7tBM5P9vITS+t8s50DjEWA4/in5JN0Nt20i7htkRExmn0YwEYyfdD92MXl3l/e1
	1jirod3Q2Yq3QNpwAPkHHF+hxVB+KtQ9JPZgS+1IKpFICDkl2b5/3oJQe+MURuHea7j2RD4iFMp
	XpxYj6bLO/kvtPi1RIEHa/mzYTA0JwpzlVPk9Bm1KVlhjr9XBmzM60WXjrqDjJZbyfMiRjCBi80
	aJ5ZDjKhoqXjivLnLCWN57pv0ZOY8QhqvnlHhLLEmaG2IE4eS1/ojpFGuMAnUEPDeEM5QjaAe8j
	ZODq8fTj6caLVWng1ds3zTrNUaT106TJM0c9zBHJeEypf0lMVChi8neECpZkk4++T/1vTmU+1PH
	JplsQAlWh8bEZPXoY8+43MPXQ54lkjfkCnMl1lMc+dv+rzSx1ER9HKUfC8Ch5XrDVsZ16/UdNXB
	rBIZg35owD4lWE=
X-Google-Smtp-Source: AGHT+IF17GZXlAb91Jfxy9pTlIJ3D2Nu7E7/sAFEgmx5LdDdbjZVwk2jSURHHw11tWRr3g2S4vjcZA==
X-Received: by 2002:a05:620a:aa09:b0:890:c3c4:3e3a with SMTP id af79cd13be357-890c3c44015mr1786663385a.53.1761105667092;
        Tue, 21 Oct 2025 21:01:07 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-891cefba740sm890066385a.29.2025.10.21.21.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 21:01:06 -0700 (PDT)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id B8E38F40069;
	Tue, 21 Oct 2025 23:54:34 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 21 Oct 2025 23:54:34 -0400
X-ME-Sender: <xms:elX4aLC030pik770lyJw1HFjcHhqyIQCuX7ErQ8tEeMDyMPW77U4zA>
    <xme:elX4aHFuicPpkoxsJp5LYea3TsD9TjB9AF0nDmV4PueIgEeCzsQnLRRb0phC9yXJ4
    63hmf9p6YL4aXkHmnQTS0U5veVGGnt5M3cw23anj_2Mcd1fLzkiZvg>
X-ME-Received: <xmr:elX4aAIUO52K9X5OO16y3Lm0NW6YVw4JpKN7pF4k-TBlLKfE10byJg6x3PuVpqgbLfVWWMdQslalBV5OGjkF-y1B3tZiLhdoF8Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddugedvheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucfrhhhishhhihhnghdqkffkrfgprhhtucdliedtjedmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhu
    nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
    htthgvrhhnpefhtedvgfdtueekvdekieetieetjeeihedvteehuddujedvkedtkeefgedv
    vdehtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhh
    phgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunh
    drfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphht
    thhopeduiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlihgtvghrhihhlh
    esghhoohhglhgvrdgtohhmpdhrtghpthhtohepmhhtuhhrqhhuvghtthgvsegsrgihlhhi
    sghrvgdrtghomhdprhgtphhtthhopehssghohigusehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehvihhrvghshhdrkhhumhgrrheslhhinhgrrhhordhorhhgpdhrtghpthhtohep
    ohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgrrhihsehgrghrhihguh
    hordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgt
    ohhmpdhrtghpthhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    grrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:elX4aOqOfxPrS7bIQrPHpyMAZ3qgOfzu0OR-QVZXCI1xbLdT_d-rCw>
    <xmx:elX4aHgxagl4-Cqo6mXBsFVT4ONUZjri3TXtJuoL8vKaFsmi-kx1Wg>
    <xmx:elX4aNYrr-a03aKUgmHn6Zkh6_s1le6y0FAnmyQxCd3KfL9kcuPGfw>
    <xmx:elX4aPkrP2c0kHxTJ_QAlMhASriP_H8mB01-84kx2FIVio8gxC8qkw>
    <xmx:elX4aDztK2sXpcUSk_9h29QmgNZW4jSkvB4MmB3vRsc84tpFYLXni4mj>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Oct 2025 23:54:34 -0400 (EDT)
Date: Tue, 21 Oct 2025 23:54:34 -0400
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Implement Send and Sync for clk
Message-ID: <aPhVehr_in20rqoY@tardis-2.local>
References: <20251020-clk-send-sync-v2-0-44ab533ae084@google.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020-clk-send-sync-v2-0-44ab533ae084@google.com>

On Mon, Oct 20, 2025 at 09:35:33AM +0000, Alice Ryhl wrote:
> I added a patch to remove the Send/Sync impl for the Tyr driver as well.
> I think it's fine for the Tyr patch to land through whichever tree takes
> the clk patch, as there should be no non-trivial merge conflicts. Or we
> can also take the clk patch through drm-rust where tyr patches normally
> go if preferred by clk maintainers.
> 
> Regarding Daniel's patch [1], I suggest that Daniel sends his type-state
> change rebased on top of this series (without including the patches in
> this series in his).
> 
> [1]: https://lore.kernel.org/rust-for-linux/20250910-clk-type-state-v2-2-1b97c11bb631@collabora.com/
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

For the whole series:

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> ---
> Changes in v2:
> - Rebase on v6.18-rc1.
> - Add patch to tyr driver.
> - Link to v1: https://lore.kernel.org/r/20250904-clk-send-sync-v1-1-48d023320eb8@google.com
> 
> ---
> Alice Ryhl (2):
>       rust: clk: implement Send and Sync
>       tyr: remove impl Send/Sync for TyrData
> 
>  drivers/gpu/drm/tyr/driver.rs | 12 ------------
>  rust/kernel/clk.rs            |  7 +++++++
>  2 files changed, 7 insertions(+), 12 deletions(-)
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20250904-clk-send-sync-3cfa7f4e1ce2
> 
> Best regards,
> -- 
> Alice Ryhl <aliceryhl@google.com>
> 
