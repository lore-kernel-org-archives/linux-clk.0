Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D66D56B848
	for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 19:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790192067; cv=none; b=ocHpXvrQ3vi7joipZbjXhpAV1ey06BaQApQQUhGqgGElq3p4FWvK78+lEzjAnkzRs9YlUwfh6a6S+SWnVYo968YEy5Ny42M/tx1KHJ5XKhIHg0WOUHH53TkkrAL40OKr0JvaIsk4jiJtbjNyvAh6u5hDid4jJ5Mz1GnHQ0UIG8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790192067; c=relaxed/simple;
	bh=PB95bkR8q0xqzq5Jacy8pzAJbKlvGJzOjPiJJrp2vys=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eXxXAta4sNuc2YTMI3aoxYv7DkSnIYxmLjVkgwxig1XDqDCPl5L1hMS5UOI9P3AvD09qWfovyrpYQKZrStVHWyYF6YXrCHeDMJgyIMTGTEIOn2dQo5J1BrzV2DaFoMRsi1ejnSbfmvU8S2paLJEFbIE3RVAWoikAcIkRU3drB8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N5FUZ56W; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HHHOG3H4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N5FUZ56W";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HHHOG3H4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790192064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NIXvQ3GnvmhPwRTBSZG3po+BNh/ksNDKssG8uwTWus8=;
	b=N5FUZ56W1nthtg/mUzpjs7OKkj/lXnvlmNr0ji2T7YLxUX8ekCtotlS19dQL7CHhIsIRG1
	ZYzQlj3QTNETr7GD8AuvLdBoAblhPW9dcV8hzQzdkCdBXWTwX3PKrqSXXFTny0q8QccMwB
	J3cg20Id0NsfgrBJHEvBiQgSKr6yJEQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-FaLqdPNhOvKFlZn_P0-yIw-1; Wed, 23 Sep 2026 15:34:22 -0400
X-MC-Unique: FaLqdPNhOvKFlZn_P0-yIw-1
X-Mimecast-MFC-AGG-ID: FaLqdPNhOvKFlZn_P0-yIw_1790192062
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e8472ee1eso21846986d6.0
        for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 12:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790192062; x=1790796862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NIXvQ3GnvmhPwRTBSZG3po+BNh/ksNDKssG8uwTWus8=;
        b=HHHOG3H4Zr159ii67u/DIk3xOyJ4j1FGjWGTIrsp8YuX1P1btIkmeWWG089xlMBMwa
         BIRCEoXD3c5UCD57NPtzZRCUXO9oDV/3y/Z8Yb54jL6FATq24g8vFps2Dx04NNpEPxwE
         X4h/RE5X8No/r/o0IfOUC1vZHD3au1VIg25DeAnAl81l+y233n0zKlS4fOpczHYTMvmD
         H9xEfAVvvEYmz3PMfGBVVpzsXwajIJ5HYna4xTeE+JBu2iRSpLHqX4uKzReI4AmfW470
         rMZNkAcvlWhA8vIm0N5uz03nGNWlH1ewEQ9un/gpoyYuWHbF5WyOu/s2Io8HsZ6Nlvsi
         eMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790192062; x=1790796862;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NIXvQ3GnvmhPwRTBSZG3po+BNh/ksNDKssG8uwTWus8=;
        b=l2rWgxejIjY+IqiLj6ysAa6F/mBJ80eoC1aZGAGM5KHKBWN9NUR/4RlBlj+CrxFYnn
         +fjWgfesPdTs/onMqG/YncwlI+SVlwzmhS3s7GQ3ZK+vSBiyLHeiXnLGnqZNaAh8iWO0
         LSa2cjDNgRg+/nH705RcyJ7EJ6+c0uxHyTeMNriqC/xl98pBUQHppp5DZc5CIlDyLZUk
         PT94Hx+WDovcKlNa5iBDfebrsjiMTtS7lYACAKO6Zif9QnoEQ1XUIB8FEOiK1LkK9SG/
         ULeud6ySuFBxFUo3QLq1ysi2a7HfZu4MCnEAZuPpZ9AJ2xP/1tNMLHSJgGUE91k+0pUg
         pGzw==
X-Forwarded-Encrypted: i=1; AKwUvBw4ZmTDplshgVRHbe1ycdmD/A+LgaQEz20sxK3hoS5yI77bNTrmYBbTzK8sNEBi2i3bcGUJLk2gYS0=@vger.kernel.org
X-Gm-Message-State: AFuF++lNY4VOvHwm1im+DvemlJtEkoaaF4bvdYBdCBDbO01BqESmFJKx
	odObv+OOIqQNumLL7yFLPvry3Bhm1jyD6c2PLA8wHu25t0v4An/vM643fGOt7V6n77DW2vD5Sgt
	aaFDqHixo+bSwh2KdvqBPY+yvFllLCXMcf7tle59KobHoM8yONgHTKD7fVI+51Q==
X-Gm-Gg: AYBFou0Zvw3eEkCReHmXAYE7YMeDI0LY21rjDxFEXEMzDWNAI5E6XpNJAEict/ncCJW
	Yxtj90MKkYXwc+mWlNsdtOD/LxVXCjkJgxPJs2zObAhQUutaOmCm7P0AqzjsoFspWJW3YgEgHD7
	IVXYi1lN0Cavvx7mh/THs0eUnd9MiwRJKbtP1dbDUxrUBPUj8syF1geIxFU+lbwnyoLkJqMvLTL
	mFlgsuXwZfHKxxfGZGW4iNi21sINdHE/2014owNXFOqf+ubZWNbVWxzDIj3z5JuF0F8D4mnxlPS
	khXTWvonCNY1iu9e8ysypi7hOBrTn6apfMKJkuWngyA1WrVesm8ksV2px7G9I4Jbl2jPPCdaZz1
	R184mA4k=
X-Received: by 2002:a05:6214:5c08:b0:912:5c63:c401 with SMTP id 6a1803df08f44-9141e7d3cd7mr2405116d6.36.1790192062015;
        Wed, 23 Sep 2026 12:34:22 -0700 (PDT)
X-Received: by 2002:a05:6214:5c08:b0:912:5c63:c401 with SMTP id 6a1803df08f44-9141e7d3cd7mr2404576d6.36.1790192061413;
        Wed, 23 Sep 2026 12:34:21 -0700 (PDT)
Received: from [192.168.134.224] ([2600:382:8529:2779:5d36:56ab:46b2:2e62])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9141e0d44e7sm1828446d6.3.2026.09.23.12.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:34:20 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Georgios Androutsopoulos <georgeandrout13@gmail.com>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, linux-clk@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260908225615.1732105-1-georgeandrout13@gmail.com>
References: <20260908225615.1732105-1-georgeandrout13@gmail.com>
Subject: Re: [PATCH] rust: clk: document overflow panics in `Hertz`
 constructors
Message-Id: <179019195888.123225.14441141476200838196.b4-ty@b4>
Date: Wed, 23 Sep 2026 15:32:38 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=334; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=C0P714IC2ygMz1RepkhOWhkiEsy2CAigGu+y7aDcJtA=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK2aG5S+8H3/n7Y8keXeSU+5E9Lu7RKM7Xo0gzz1PZrp
 66/6fG+0VHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBELDYzMhz7vSdu0ynlU1/v
 L/NbM9/d+0ts2Vx+/4dJPHvXnPohFvic4Z/u3NTrP18/uL36zT6GTcLiBx+sqj/CVd7POUnjfMW
 tfVtYAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Tue, 08 Sep 2026 18:56:15 -0400, Georgios Androutsopoulos wrote:
> rust: clk: document overflow panics in `Hertz` constructors

Applied, thanks!

[1/1] rust: clk: document overflow panics in `Hertz` constructors
      commit: 45a68afbd4b632538a0956ba783fca45b8ceb446

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

