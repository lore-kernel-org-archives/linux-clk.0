Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F79407CC0
	for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 12:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783685408; cv=none; b=PPrCrd9bwe0RyktZw+Vnp1tN7atw7fezeuULUOwamiqX3xJxVqUg47mMMyhj0JgYX9VqggrTE1KZ0sMxHxCg0KaxVFmfQF/4E33uXOpo+WYp005w735JN5iX2tQrTuhDJQlX5LEyLe7mdBj7Z7vDsRZKHGQFspIGTBT1HKC24R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783685408; c=relaxed/simple;
	bh=aQwcX9XYj4VW0rglRN9smWthALe2etv1kQSIKdoKzCE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=s8kvnbzXtYa+oZfD3TH8l/r5rhmW2dfwer2w67VaulHNYJvaW+VmxkjIgnBFual7Hyz9WLtpssjNoZIcPoh9qRn4bdhwRJyM4YXX6fcxfJLi1g2FuX3az9GjbSvuysZGWVx/cCH0AnGSqHaAYAAVtZa71ir4+splajgf4co5uzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qBXCa+db; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qBXCa+db"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CAA304E40D47;
	Fri, 10 Jul 2026 12:10:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9A00A60342;
	Fri, 10 Jul 2026 12:10:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 685E411BD0BCF;
	Fri, 10 Jul 2026 14:09:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783685402; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gk9jwtLF3KGI28XFf4LplvEp5Vfvp7PmyBj6FTbwmKM=;
	b=qBXCa+dbAg0BNoCZk3+hs+XRRziKjwAkvc4JhGgW5DNe5/RJIBfvLG7PIV9YVJ40wWu327
	HwlDB6D6x6OAvhHiGXr5LdSSGbdnVAvwI2oozlhWDK4jX5Libs1WZqKCB/NX1OqKeX/qvj
	/JgoCoRzLITcujEVYb75FmyyDBuMF+jNxpOL+pM9YoO7NStT1WQ9deuM4RBUVw+1HufR7P
	QoXJQfuP7mQ0oxSuDOEqKEw3vIxcpCU/2SG4TMU8PHbwSnLF2Bme6b0altUu8FzzGBGP6l
	ITuhPTj+bYbZD0FFGJCMpOqGrDNidsELwyq5ggS51pqW576QB7qdwcP89awUjQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Antoine Tenart <atenart@kernel.org>,  Christian Marangi
 <ansuelsmth@gmail.com>,  Conor Dooley <conor+dt@kernel.org>,  David S.
 Miller <davem@davemloft.net>,  Geert Uytterhoeven
 <geert+renesas@glider.be>,  Herbert Xu <herbert@gondor.apana.org.au>,
  Jayesh Choudhary <j-choudhary@ti.com>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Magnus Damm <magnus.damm@gmail.com>,  Michael
 Turquette <mturquette@baylibre.com>,  Olivia Mackall <olivia@selenic.com>,
  Rob Herring <robh@kernel.org>,  Thomas Gleixner <tglx@kernel.org>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Pascal EBERHARD
 <pascal.eberhard@se.com>,  Wolfram Sang
 <wsa+renesas@sang-engineering.com>,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-crypto@vger.kernel.org,  linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 07/16] clk: tests: Add Kunit testing for
 of_clk_get_parent_name()
In-Reply-To: <177595738949.5403.11279360430887628318@lazor> (Stephen Boyd's
	message of "Sat, 11 Apr 2026 18:29:49 -0700")
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
	<20260327-schneider-v7-0-rc1-crypto-v1-7-5e6ff7853994@bootlin.com>
	<177595738949.5403.11279360430887628318@lazor>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 10 Jul 2026 14:09:53 +0200
Message-ID: <87echbgi5q.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Stephen,

On 11/04/2026 at 18:29:49 -07, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Miquel Raynal (Schneider Electric) (2026-03-27 13:09:29)
>> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
>> index b814b45f1f7e..8a17ad0d185f 100644
>> --- a/drivers/clk/clk_test.c
>> +++ b/drivers/clk/clk_test.c
>> @@ -3651,9 +3651,19 @@ static void clk_parse_clkspec_with_incorrect_inde=
x_and_name(struct kunit *test)
>>         KUNIT_EXPECT_TRUE(test, IS_ERR(hw));
>>  }
>>=20=20
>
> Add a comment here to tell us what the test is expecting.

Yep, done.

>> +static void clk_parse_and_get_parent_name(struct kunit *test)
>> +{
>> +       struct clk_parse_clkspec_ctx *ctx =3D test->priv;
>> +
>> +       KUNIT_EXPECT_STREQ(test,
>> +                          of_clk_get_parent_name(ctx->cons_np, 0),
>> +                          clk_parse_clkspec_1_init_data.name);
>> +}
>
> Reading this test is pretty hard because all the context is in the
> common setup. Maybe the common setup is too broad in this case and
> should be simplified so that tests can show more setup and assert code
> for the things it wants to do. For example, if the name can be passed
> from this test directly it would clarify by moving context into test
> function scope.
>
> 	const char *pname =3D "expected-name";
>
> 	KUNIT_ASSERT_EQ(test, 0, setup_parent(pname));
>
> 	KUNIT_EXPECT_STREQ(test, pname,
> 			   of_clk_get_parent_name(ctx->cons_np, 0));

While I understand the feeling, provider 1 and 2 are shared with other
test cases which would require restructuring quite a bit the whole test
suite for IMHO little benefit. I can however make more obvious the string
that is actually expected by redefining it in plain sight at the call
site.

>>  static struct kunit_case clk_parse_clkspec_test_cases[] =3D {
>>         KUNIT_CASE(clk_parse_clkspec_with_correct_index_and_name),
>>         KUNIT_CASE(clk_parse_clkspec_with_incorrect_index_and_name),
>> +       KUNIT_CASE(clk_parse_and_get_parent_name),
>
> Better to call the test something like
> of_clk_get_parent_name_gets_parent_name to indicate what we're
> testing.

Fine by me.

Thanks,
Miqu=C3=A8l
